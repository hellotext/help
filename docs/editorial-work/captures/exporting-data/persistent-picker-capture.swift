import AppKit
import CoreGraphics
import Foundation
import ImageIO
import ScreenCaptureKit
import UniformTypeIdentifiers
import Vision

// A single picker selection authorizes one exact local demo window for this process.
// All six article views use that same window ID. No API here requests a window catalog.
// Before and after every CAPTURE, the controller must inspect only its bound
// browser tab: exactURL, Enterprise, and signed-in design-system@example.test.
// Close the account popover before capture; do not click either export action.
private let requiredBundleID = "com.google.Chrome"
private let outputDirectory = "/private/tmp"

private enum Shot: String, CaseIterable {
    case audienceAllES = "audience-all-es"
    case audienceAllEN = "audience-all-en"
    case audienceSelectedES = "audience-selected-es"
    case audienceSelectedEN = "audience-selected-en"
    case revenueES = "revenue-es"
    case revenueEN = "revenue-en"

    var title: String {
        switch self {
        case .audienceAllES, .audienceSelectedES:
            "Todos los contactos de Enterprise - Hellotext"
        case .audienceAllEN, .audienceSelectedEN:
            "View all Enterprise contacts - Hellotext"
        case .revenueES:
            "Reporte de ingresos | Hellotext"
        case .revenueEN:
            "Revenue report | Hellotext"
        }
    }

    var exactURL: String {
        switch self {
        case .audienceAllES, .audienceAllEN, .audienceSelectedES, .audienceSelectedEN:
            "http://127.0.0.1:3191/hellotext/audience"
        case .revenueES, .revenueEN:
            "http://127.0.0.1:3191/hellotext/reports/e9Z2LN51?from=2026-09-19&to=2026-09-25&preset=custom&metric=ai_driven_revenue"
        }
    }

    // Chrome may omit the scheme in its toolbar. The controller must compare
    // the already-bound tab's entire URL with exactURL before and after each shot.
    var toolbarOCRMarkers: [String] {
        let url = URLComponents(string: exactURL)!
        let authority = "\(url.host!):\(url.port!)"
        return ([authority, url.path] + (url.queryItems ?? []).map {
            "\($0.name)=\($0.value ?? "")"
        }).map { $0.lowercased() }
    }

    var visibleControlOCRMarkers: [String] {
        switch self {
        case .audienceAllES: ["exportar a archivo"]
        case .audienceAllEN: ["export to file"]
        case .audienceSelectedES: ["exportar seleccionados"]
        case .audienceSelectedEN: ["export selected"]
        // The Revenue export button is icon-only. Its adjacent period control
        // is visible; the controller must also inspect the button's accessible
        // name, Exportar/Export, in the same bound tab without clicking it.
        case .revenueES: ["reporte de ingresos", "personalizado"]
        case .revenueEN: ["revenue report", "custom"]
        }
    }
}

private let requiredTitles = Set(Shot.allCases.map(\.title))

private enum CaptureError: Error, CustomStringConvertible {
    case invalidTarget(String)
    case invalidOutput(String)
    case captureFailed(String)

    var description: String {
        switch self {
        case .invalidTarget(let message), .invalidOutput(let message), .captureFailed(let message):
            return message
        }
    }

    var targetIsInvalid: Bool {
        if case .invalidTarget = self { return true }
        return false
    }
}

private struct Target {
    let windowID: CGWindowID
    let ownerPID: pid_t
    let selectedFrame: CGRect
    let selectedScale: CGFloat
}

private struct WindowSnapshot {
    let bounds: CGRect
}

private func selectedWindowSnapshot(windowID: CGWindowID, ownerPID: pid_t,
                                    requiredTitle: String? = nil) throws -> WindowSnapshot {
    // .optionIncludingWindow scopes this query to the one picker-selected ID.
    guard let list = CGWindowListCopyWindowInfo([.optionIncludingWindow], windowID) as? [[String: Any]],
          list.count == 1,
          let info = list.first,
          (info[kCGWindowNumber as String] as? NSNumber)?.uint32Value == windowID,
          (info[kCGWindowOwnerPID as String] as? NSNumber)?.int32Value == ownerPID,
          (info[kCGWindowLayer as String] as? NSNumber)?.intValue == 0,
          let title = info[kCGWindowName as String] as? String,
          (requiredTitle.map { title == $0 } ?? requiredTitles.contains(title)),
          let boundsDictionary = info[kCGWindowBounds as String] as? NSDictionary,
          NSRunningApplication(processIdentifier: ownerPID)?.bundleIdentifier == requiredBundleID else {
        throw CaptureError.invalidTarget("Picker-selected Chrome demo window is no longer the same titled layer-zero window")
    }
    var bounds = CGRect.zero
    guard CGRectMakeWithDictionaryRepresentation(boundsDictionary as CFDictionary, &bounds),
          bounds.width > 0, bounds.height > 0 else {
        throw CaptureError.invalidTarget("Picker-selected window has invalid bounds")
    }
    return WindowSnapshot(bounds: bounds)
}

private func hasEmbeddedICC(_ data: Data) -> Bool {
    guard data.starts(with: [137, 80, 78, 71, 13, 10, 26, 10]) else { return false }
    var offset = 8
    while offset + 12 <= data.count {
        let length = data[offset..<(offset + 4)].reduce(UInt32(0)) { ($0 << 8) | UInt32($1) }
        guard Int(length) <= data.count - offset - 12 else { return false }
        let type = String(decoding: data[(offset + 4)..<(offset + 8)], as: UTF8.self)
        if type == "iCCP" { return true }
        if type == "IDAT" || type == "IEND" { return false }
        offset += Int(length) + 12
    }
    return false
}

private func validatedOutputURL(_ path: String) throws -> URL {
    guard path.hasPrefix("/"), !path.contains("\n"), !path.contains("\r") else {
        throw CaptureError.invalidOutput("Output must be an absolute single-line path")
    }
    let url = URL(fileURLWithPath: path).standardizedFileURL
    guard url.deletingLastPathComponent().path == outputDirectory,
          url.pathExtension.lowercased() == "png",
          !FileManager.default.fileExists(atPath: url.path) else {
        throw CaptureError.invalidOutput("Output must be a new PNG directly in /private/tmp")
    }
    return url
}

private func capture(target: Target, shot: Shot, outputURL: URL) throws -> String {
    let before = try selectedWindowSnapshot(windowID: target.windowID, ownerPID: target.ownerPID,
                                            requiredTitle: shot.title)
    guard target.selectedScale >= 2 else {
        throw CaptureError.invalidTarget("Picker-selected window density is below 2x")
    }

    let temporaryURL = URL(fileURLWithPath: outputDirectory)
        .appendingPathComponent("hellotext-selected-window-\(UUID().uuidString).png")
    defer { try? FileManager.default.removeItem(at: temporaryURL) }

    // -l captures only the selected window; -a excludes attached windows.
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
    process.arguments = ["-l", String(target.windowID), "-a", "-o", "-x", "-t", "png", temporaryURL.path]
    let completion = DispatchSemaphore(value: 0)
    process.terminationHandler = { _ in completion.signal() }
    try process.run()
    if completion.wait(timeout: .now() + .seconds(15)) == .timedOut {
        process.terminate()
        throw CaptureError.captureFailed("Native selected-window capture exceeded 15 seconds")
    }
    let after = try selectedWindowSnapshot(windowID: target.windowID, ownerPID: target.ownerPID,
                                           requiredTitle: shot.title)
    guard process.terminationStatus == 0 else {
        throw CaptureError.captureFailed("Native selected-window capture failed")
    }
    guard before.bounds.equalTo(after.bounds) else {
        throw CaptureError.invalidTarget("Picker-selected window moved or resized during capture")
    }
    guard let source = CGImageSourceCreateWithURL(temporaryURL as CFURL, nil),
          CGImageSourceGetType(source) as String? == UTType.png.identifier,
          let image = CGImageSourceCreateImageAtIndex(source, 0, nil),
          image.width >= 2 * Int(before.bounds.width),
          image.height >= 2 * Int(before.bounds.height),
          image.colorSpace?.name as String? == CGColorSpace.displayP3 as String,
          try hasEmbeddedICC(Data(contentsOf: temporaryURL)) else {
        throw CaptureError.captureFailed("Selected window did not produce a 2x Display P3 PNG with embedded ICC profile")
    }

    let request = VNRecognizeTextRequest()
    request.recognitionLevel = .accurate
    request.recognitionLanguages = ["es-ES", "en-US"]
    try VNImageRequestHandler(cgImage: image).perform([request])
    let recognized = (request.results ?? [])
        .compactMap { $0.topCandidates(1).first?.string }
        .joined(separator: " ")
        .lowercased()
        .folding(options: .diacriticInsensitive, locale: Locale(identifier: "es"))
    guard shot.visibleControlOCRMarkers.allSatisfy(recognized.contains) else {
        throw CaptureError.captureFailed("Selected-window image failed the expected visible-control OCR check for \(shot.rawValue)")
    }
    // Corroborate the local URL in the selected window's native pixels. The
    // bound-tab preflight and postflight enforce exactURL including query order.
    guard shot.toolbarOCRMarkers.allSatisfy(recognized.contains) else {
        throw CaptureError.captureFailed("Selected-window image failed the local URL OCR check for \(shot.rawValue)")
    }

    // A final check immediately before publication also catches an ID reused while OCR ran.
    let finalSnapshot = try selectedWindowSnapshot(windowID: target.windowID, ownerPID: target.ownerPID,
                                                   requiredTitle: shot.title)
    guard finalSnapshot.bounds.equalTo(before.bounds) else {
        throw CaptureError.invalidTarget("Picker-selected window changed before the PNG could be saved")
    }
    guard !FileManager.default.fileExists(atPath: outputURL.path) else {
        throw CaptureError.invalidOutput("Output path was created by another process")
    }
    try FileManager.default.moveItem(at: temporaryURL, to: outputURL)
    return "SAVED \(shot.rawValue) \(outputURL.path) \(image.width)x\(image.height) Display-P3 ICC OCR"
}

final class PersistentPickerCapture: NSObject, NSApplicationDelegate, SCContentSharingPickerObserver {
    private var selectedFilter: SCContentFilter?
    private var target: Target?
    private var commands: [String] = []
    private var busy = false
    private var inputClosed = false
    private var stopping = false
    private var pickerStarted = false
    private let captureQueue = DispatchQueue(label: "hellotext.selected-window.capture", qos: .userInitiated)

    func applicationDidFinishLaunching(_ notification: Notification) { startPicker() }

    func startPicker() {
        guard !pickerStarted else { return }
        pickerStarted = true
        let picker = SCContentSharingPicker.shared
        var configuration = SCContentSharingPickerConfiguration()
        configuration.allowedPickerModes = .singleWindow
        configuration.allowsChangingSelectedContent = false
        picker.defaultConfiguration = configuration
        picker.maximumStreamCount = 1
        picker.add(self)
        picker.isActive = true
        picker.present(using: .window)
        fputs("Select the exact local Hellotext Exporting data Chrome window once.\n", stderr)
    }

    func contentSharingPicker(_ picker: SCContentSharingPicker, didUpdateWith filter: SCContentFilter, for stream: SCStream?) {
        guard target == nil, !stopping else { return }
        do {
            guard filter.style == .window,
                  filter.includedWindows.count == 1,
                  let window = filter.includedWindows.first,
                  let owner = window.owningApplication,
                  owner.bundleIdentifier == requiredBundleID,
                  window.title.map(requiredTitles.contains) == true,
                  window.windowLayer == 0,
                  filter.pointPixelScale >= 2 else {
                throw CaptureError.invalidTarget("Selection is not the exact 2x Chrome demo window")
            }
            let candidate = Target(windowID: window.windowID, ownerPID: owner.processID,
                                   selectedFrame: window.frame, selectedScale: CGFloat(filter.pointPixelScale))
            let snapshot = try selectedWindowSnapshot(windowID: candidate.windowID, ownerPID: candidate.ownerPID)
            guard abs(snapshot.bounds.width - candidate.selectedFrame.width) <= 1,
                  abs(snapshot.bounds.height - candidate.selectedFrame.height) <= 1 else {
                throw CaptureError.invalidTarget("Selected window dimensions differ from the scoped window check")
            }
            selectedFilter = filter // Retain the one selected filter for the process lifetime.
            target = candidate
            // Keep the single-window picker authorization active for this process.
            // The UI closes after selection; only the selected filter remains usable.
            print("READY window=\(candidate.windowID) pid=\(candidate.ownerPID)")
            fflush(stdout)
            startInputReader()
        } catch {
            fputs("Selection refused: \(error)\n", stderr)
            exit(1)
        }
    }

    func contentSharingPicker(_ picker: SCContentSharingPicker, didCancelFor stream: SCStream?) {
        fputs("Picker cancelled; no window content read.\n", stderr)
        exit(2)
    }

    func contentSharingPickerStartDidFailWithError(_ error: Error) {
        fputs("Picker failed: \(error)\n", stderr)
        exit(3)
    }

    private func startInputReader() {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            while let line = readLine() {
                DispatchQueue.main.async { self?.enqueue(line) }
            }
            DispatchQueue.main.async {
                self?.inputClosed = true
                self?.processNext()
            }
        }
    }

    private func enqueue(_ line: String) {
        guard !stopping else { return }
        commands.append(line)
        processNext()
    }

    private func processNext() {
        guard !busy, let target else { return }
        guard !commands.isEmpty else {
            if inputClosed { exit(0) }
            return
        }
        let command = commands.removeFirst()
        if command == "QUIT" {
            stopping = true
            print("BYE")
            fflush(stdout)
            exit(0)
        }
        guard command.hasPrefix("CAPTURE ") else {
            print("ERROR expected CAPTURE <shot-key> /private/tmp/new.png or QUIT")
            fflush(stdout)
            processNext()
            return
        }
        let arguments = command.dropFirst("CAPTURE ".count)
            .split(separator: " ", maxSplits: 1, omittingEmptySubsequences: false)
        guard arguments.count == 2, let shot = Shot(rawValue: String(arguments[0])) else {
            print("ERROR unknown shot key")
            fflush(stdout)
            processNext()
            return
        }
        let path = String(arguments[1])
        let outputURL: URL
        do { outputURL = try validatedOutputURL(path) }
        catch {
            print("ERROR \(error)")
            fflush(stdout)
            processNext()
            return
        }
        busy = true
        captureQueue.async { [weak self] in
            let result: Result<String, Error>
            do { result = .success(try capture(target: target, shot: shot, outputURL: outputURL)) }
            catch { result = .failure(error) }
            DispatchQueue.main.async {
                guard let self else { return }
                switch result {
                case .success(let message): print(message)
                case .failure(let error):
                    print("ERROR \(error)")
                    if (error as? CaptureError)?.targetIsInvalid == true { self.stopping = true }
                }
                fflush(stdout)
                self.busy = false
                if self.stopping { exit(1) }
                self.processNext()
            }
        }
    }
}

@main
struct Main {
    static func main() {
        guard CommandLine.arguments.count == 1 else {
            fputs("Usage: hellotext-persistent-picker-capture\n", stderr)
            exit(64)
        }
        umask(0o077)
        let app = NSApplication.shared
        let delegate = PersistentPickerCapture()
        app.delegate = delegate
        app.setActivationPolicy(.regular)
        app.activate(ignoringOtherApps: true)
        app.finishLaunching()
        delegate.startPicker()
        withExtendedLifetime(delegate) { app.run() }
    }
}
