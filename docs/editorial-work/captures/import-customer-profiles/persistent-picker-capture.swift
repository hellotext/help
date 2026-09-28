import AppKit
import CoreGraphics
import Foundation
import ImageIO
import ScreenCaptureKit
import UniformTypeIdentifiers
import Vision

// A single picker selection authorizes one exact local demo window for this process.
// All twelve article states use that same window ID. No API here requests a
// window catalog. Before and after every CAPTURE, the controller must inspect
// only its already-bound browser tab: exact expectedURL, Enterprise, and
// signed-in design-system@example.test. The controller must remove the saved candidate
// and end the batch if its postflight differs. Close the account popover before
// capture. File selection is safe; Continue persists a draft and the final
// Save & Start import queues jobs, so neither may be clicked without the
// separate isolated-database authorization and verification.
private let requiredBundleID = "com.google.Chrome"
private let outputDirectory = "/private/tmp"

private enum Shot: String, CaseIterable {
    case audienceAddES = "audience-add-es"
    case audienceAddEN = "audience-add-en"
    case chooserES = "chooser-es"
    case chooserEN = "chooser-en"
    case selectedFileES = "selected-file-es"
    case selectedFileEN = "selected-file-en"
    case mappingES = "mapping-es"
    case mappingEN = "mapping-en"
    case consentES = "consent-es"
    case consentEN = "consent-en"
    case listsES = "lists-es"
    case listsEN = "lists-en"

    var title: String {
        switch self {
        case .audienceAddES:
            "Todos los contactos de Enterprise - Hellotext"
        case .audienceAddEN:
            "View all Enterprise contacts - Hellotext"
        case .chooserES, .selectedFileES:
            "Importa a tus clientes - Hellotext"
        case .chooserEN, .selectedFileEN:
            "Import your customers - Hellotext"
        case .mappingES:
            "Revisa las columnas de clientes a importar - Hellotext"
        case .mappingEN:
            "Review customer columns to import - Hellotext"
        case .consentES:
            "Consentimiento de marketing - Hellotext"
        case .consentEN:
            "Marketing Consent - Hellotext"
        case .listsES:
            "Organiza a tus clientes - Hellotext"
        case .listsEN:
            "Organize your customers - Hellotext"
        }
    }

    var fixedPath: String? {
        switch self {
        case .audienceAddES, .audienceAddEN:
            "/hellotext/audience"
        case .chooserES, .chooserEN, .selectedFileES, .selectedFileEN:
            "/hellotext/audience/imports/new"
        case .mappingES, .mappingEN, .consentES, .consentEN, .listsES, .listsEN:
            nil
        }
    }

    var dynamicStep: String? {
        switch self {
        case .mappingES, .mappingEN: "mapping"
        case .consentES, .consentEN: "consent"
        case .listsES, .listsEN: "lists"
        default: nil
        }
    }

    var visibleControlOCRMarkers: [String] {
        switch self {
        case .audienceAddES: ["importar clientes"]
        case .audienceAddEN: ["import customers"]
        case .chooserES: ["conectar un servicio", "elegir un archivo para subir"]
        case .chooserEN: ["connect a service", "choose a file to upload"]
        case .selectedFileES: ["import-demo.csv", "continuar con la importacion"]
        case .selectedFileEN: ["import-demo.csv", "continue to import"]
        case .mappingES: ["revisa las columnas de clientes a importar"]
        case .mappingEN: ["review customer columns to import"]
        case .consentES: ["consentimiento para promociones de marketing"]
        case .consentEN: ["consent to marketing promotions"]
        case .listsES: ["organiza a tus clientes", "guardar e importar"]
        case .listsEN: ["organize your customers", "save & start import"]
        }
    }
}

private func validatedExpectedURL(_ text: String, for shot: Shot) throws -> URLComponents {
    guard let url = URLComponents(string: text),
          url.scheme == "http",
          ["127.0.0.1", "localhost"].contains(url.host ?? ""),
          url.port == 3191,
          url.user == nil, url.password == nil,
          url.query == nil, url.fragment == nil,
          url.percentEncodedPath == url.path,
          url.string == text else {
        throw CaptureError.invalidOutput("expectedURL must be an exact plain localhost:3191 HTTP URL without query or fragment")
    }
    if let fixedPath = shot.fixedPath {
        guard url.path == fixedPath else {
            throw CaptureError.invalidOutput("expectedURL does not match the fixed path for \(shot.rawValue)")
        }
    } else {
        let parts = url.path.split(separator: "/")
        let id = parts.count == 5 ? String(parts[3]) : ""
        let step = shot.dynamicStep ?? ""
        let validID = !id.isEmpty && id.utf8.allSatisfy { byte in
            (48...57).contains(byte) || (65...90).contains(byte) ||
            (97...122).contains(byte) || byte == 45 || byte == 95
        }
        guard parts.count == 5,
              parts[0] == "hellotext", parts[1] == "audience", parts[2] == "imports",
              validID, parts[4] == step else {
            throw CaptureError.invalidOutput("expectedURL must target the exact /hellotext/audience/imports/<id>/\(step) path")
        }
    }
    return url
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

}

private struct Target {
    let windowID: CGWindowID
    let ownerPID: pid_t
    let selectedFrame: CGRect
    let selectedBounds: CGRect
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

private func capture(target: Target, shot: Shot, expectedURL: URLComponents,
                     outputURL: URL) throws -> String {
    let before = try selectedWindowSnapshot(windowID: target.windowID, ownerPID: target.ownerPID,
                                            requiredTitle: shot.title)
    guard before.bounds.equalTo(target.selectedBounds) else {
        throw CaptureError.invalidTarget("Picker-selected window moved or resized since selection")
    }
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
    guard before.bounds.equalTo(after.bounds), after.bounds.equalTo(target.selectedBounds) else {
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
    // Chrome may omit the scheme in its toolbar. Require the complete host,
    // port, and path (including the dynamic import ID) in native pixels.
    // The bound-tab preflight and postflight enforce exact expectedURL.
    let urlMarkers = ["\(expectedURL.host!):\(expectedURL.port!)", expectedURL.path]
        .map { $0.lowercased() }
    guard urlMarkers.allSatisfy(recognized.contains) else {
        throw CaptureError.captureFailed("Selected-window image failed the local URL OCR check for \(shot.rawValue)")
    }

    // A final check immediately before publication also catches an ID reused while OCR ran.
    let finalSnapshot = try selectedWindowSnapshot(windowID: target.windowID, ownerPID: target.ownerPID,
                                                   requiredTitle: shot.title)
    guard finalSnapshot.bounds.equalTo(target.selectedBounds) else {
        throw CaptureError.invalidTarget("Picker-selected window changed before the PNG could be saved")
    }
    guard !FileManager.default.fileExists(atPath: outputURL.path) else {
        throw CaptureError.invalidOutput("Output path was created by another process")
    }
    try FileManager.default.moveItem(at: temporaryURL, to: outputURL)
    let date = ISO8601DateFormatter().string(from: Date())
    return "SAVED \(shot.rawValue) \(outputURL.path) \(image.width)x\(image.height) Display-P3 ICC OCR window=\(target.windowID) pid=\(target.ownerPID) url=\(expectedURL.string ?? "") capturedAt=\(date)"
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
        fputs("Select the exact local Hellotext Import customer profiles Chrome window once.\n", stderr)
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
            let snapshot = try selectedWindowSnapshot(windowID: window.windowID, ownerPID: owner.processID)
            let candidate = Target(windowID: window.windowID, ownerPID: owner.processID,
                                   selectedFrame: window.frame, selectedBounds: snapshot.bounds,
                                   selectedScale: CGFloat(filter.pointPixelScale))
            guard abs(snapshot.bounds.width - candidate.selectedFrame.width) <= 1,
                  abs(snapshot.bounds.height - candidate.selectedFrame.height) <= 1 else {
                throw CaptureError.invalidTarget("Selected window dimensions differ from the scoped window check")
            }
            selectedFilter = filter // Retain the one selected filter for the process lifetime.
            target = candidate
            // Keep the single-window picker authorization active for this process.
            // The UI closes after selection; only the selected filter remains usable.
            print("READY window=\(candidate.windowID) pid=\(candidate.ownerPID) title=\(window.title ?? "") bounds=\(NSStringFromRect(candidate.selectedBounds)) scale=\(candidate.selectedScale)")
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
            print("ERROR expected CAPTURE <shot-key> <exact-local-URL> /private/tmp/new.png or QUIT")
            fflush(stdout)
            processNext()
            return
        }
        let arguments = command.dropFirst("CAPTURE ".count)
            .split(separator: " ", maxSplits: 2, omittingEmptySubsequences: false)
        guard arguments.count == 3, let shot = Shot(rawValue: String(arguments[0])) else {
            print("ERROR expected shot key, exact URL, and output path")
            fflush(stdout)
            processNext()
            return
        }
        let expectedURL: URLComponents
        do { expectedURL = try validatedExpectedURL(String(arguments[1]), for: shot) }
        catch {
            print("ERROR \(error)")
            fflush(stdout)
            processNext()
            return
        }
        let path = String(arguments[2])
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
            do { result = .success(try capture(target: target, shot: shot,
                                               expectedURL: expectedURL, outputURL: outputURL)) }
            catch { result = .failure(error) }
            DispatchQueue.main.async {
                guard let self else { return }
                switch result {
                case .success(let message): print(message)
                case .failure(let error):
                    print("ERROR \(error)")
                    // A failed native capture or OCR invalidates the batch.
                    // Reinspection must precede any new picker selection.
                    self.stopping = true
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
