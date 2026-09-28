import AppKit
import CoreGraphics
import Foundation
import ImageIO
import UniformTypeIdentifiers
import Vision

// The user authorized capture of this exact window, selected by the native
// picker earlier. Never enumerate windows or replace the pinned ID/PID/bounds.
// Before and after each CAPTURE, the controller must inspect only its already-
// bound browser tab: exact expectedURL, Enterprise, and signed-in
// design-system@example.test. Every output is a private candidate in /private/tmp
// until postflight and native-pixel review. Chrome can hide its URL toolbar:
// if native URL OCR is unavailable, verify the exact URL and fictional account
// in the already-bound tab before and after the shot, check visible controls
// in native pixels, and record that the PNG itself does not show the URL.
// Continue persists a draft and Save & Start import queues jobs; neither may be
// clicked without separate isolated-database verification.
private let requiredBundleID = "com.google.Chrome"
private let outputDirectory = "/private/tmp"
private let pinnedWindowID: CGWindowID = 33329
private let pinnedOwnerPID: pid_t = 18093
private let pinnedBounds = CGRect(x: -1253, y: 88, width: 1253, height: 897)
private let requiredScale = 2

private enum Shot: String, CaseIterable {
    case audienceAddES = "audience-add-es"
    case audienceAddEN = "audience-add-en"
    case chooserES = "chooser-es"
    case chooserEN = "chooser-en"
    case selectedFileES = "selected-file-es"
    case selectedFileEN = "selected-file-en"
    case mappingES = "mapping-es"
    case mappingEN = "mapping-en"
    case mappingDetailES = "mapping-detail-es"
    case mappingDetailEN = "mapping-detail-en"
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
        case .mappingES, .mappingDetailES:
            "Revisa las columnas de clientes a importar - Hellotext"
        case .mappingEN, .mappingDetailEN:
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
        case .mappingES, .mappingEN, .mappingDetailES, .mappingDetailEN,
             .consentES, .consentEN, .listsES, .listsEN:
            nil
        }
    }

    var dynamicStep: String? {
        switch self {
        case .mappingES, .mappingEN, .mappingDetailES, .mappingDetailEN: "mapping"
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
        // The filename is truncated by the real upload card at capture width.
        // Keep its distinctive visible prefix plus the submit control.
        case .selectedFileES: ["import-demo", "continuar con la importacion"]
        case .selectedFileEN: ["import-demo", "continue to import"]
        case .mappingES: ["revisa las columnas de clientes a importar"]
        case .mappingEN: ["review customer columns to import"]
        // The focused lower frame intentionally scrolls its heading away.
        // The date property and sticky action identify this mapping state.
        case .mappingDetailES: ["cumpleanos", "guardar & continuar"]
        case .mappingDetailEN: ["birthday", "save & continue"]
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
    case controlOCRMismatch(String)

    var description: String {
        switch self {
        case .invalidTarget(let message), .invalidOutput(let message),
             .captureFailed(let message), .controlOCRMismatch(let message):
            return message
        }
    }

    var canRetryOnPinnedWindow: Bool {
        if case .controlOCRMismatch = self { return true }
        return false
    }
}

private struct Target {
    let windowID: CGWindowID
    let ownerPID: pid_t
    let bounds: CGRect
}

private let target = Target(windowID: pinnedWindowID, ownerPID: pinnedOwnerPID,
                            bounds: pinnedBounds)

private struct WindowSnapshot {
    let bounds: CGRect
    let title: String
}

private func selectedWindowSnapshot(windowID: CGWindowID, ownerPID: pid_t,
                                    requiredTitle: String? = nil) throws -> WindowSnapshot {
    // .optionIncludingWindow scopes this query to the exact authorized ID.
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
        throw CaptureError.invalidTarget("Pinned Chrome demo window is no longer the same titled layer-zero window")
    }
    var bounds = CGRect.zero
    guard CGRectMakeWithDictionaryRepresentation(boundsDictionary as CFDictionary, &bounds),
          bounds.width > 0, bounds.height > 0 else {
        throw CaptureError.invalidTarget("Pinned window has invalid bounds")
    }
    return WindowSnapshot(bounds: bounds, title: title)
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
    guard before.bounds.equalTo(target.bounds) else {
        throw CaptureError.invalidTarget("Pinned window moved or resized since original selection")
    }

    let temporaryURL = URL(fileURLWithPath: outputDirectory)
        .appendingPathComponent("hellotext-selected-window-\(UUID().uuidString).png")
    defer { try? FileManager.default.removeItem(at: temporaryURL) }

    // -l captures only the pinned window; -a excludes attached windows.
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
    guard before.bounds.equalTo(after.bounds), after.bounds.equalTo(target.bounds) else {
        throw CaptureError.invalidTarget("Pinned window moved or resized during capture")
    }
    guard let source = CGImageSourceCreateWithURL(temporaryURL as CFURL, nil),
          CGImageSourceGetType(source) as String? == UTType.png.identifier,
          let image = CGImageSourceCreateImageAtIndex(source, 0, nil),
          image.width >= requiredScale * Int(before.bounds.width),
          image.height >= requiredScale * Int(before.bounds.height),
          image.colorSpace?.name as String? == CGColorSpace.displayP3 as String,
          try hasEmbeddedICC(Data(contentsOf: temporaryURL)) else {
        throw CaptureError.captureFailed("Pinned window did not produce a 2x Display P3 PNG with embedded ICC profile")
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
    // Chrome may omit the scheme or truncate the path in its toolbar. Native
    // OCR is diagnostic here; the bound-tab CUA preflight and postflight must
    // enforce the exact expectedURL, including the dynamic import ID.
    let urlMarkers = ["\(expectedURL.host!):\(expectedURL.port!)", expectedURL.path]
        .map { $0.lowercased() }
    let missingURLMarkers = urlMarkers.filter { !recognized.contains($0) }
    let urlOCRVerified = missingURLMarkers.isEmpty

    // A final check before saving the private candidate catches an ID reused
    // while OCR ran.
    let finalSnapshot = try selectedWindowSnapshot(windowID: target.windowID, ownerPID: target.ownerPID,
                                                   requiredTitle: shot.title)
    guard finalSnapshot.bounds.equalTo(target.bounds) else {
        throw CaptureError.invalidTarget("Pinned window changed before the PNG could be saved")
    }
    // A control-label OCR miss discards the candidate. Pinned window metadata
    // has already passed; the controller must inspect the bound tab before retry.
    guard shot.visibleControlOCRMarkers.allSatisfy(recognized.contains) else {
        throw CaptureError.controlOCRMismatch("Visible-control OCR did not confirm \(shot.rawValue); candidate discarded; inspect the bound tab before retrying")
    }
    guard !FileManager.default.fileExists(atPath: outputURL.path) else {
        throw CaptureError.invalidOutput("Output path was created by another process")
    }
    try FileManager.default.moveItem(at: temporaryURL, to: outputURL)
    let date = ISO8601DateFormatter().string(from: Date())
    let status = urlOCRVerified ? "CANDIDATE_URL_OCR_VERIFIED" : "CANDIDATE_URL_OCR_UNVERIFIED_REVIEW_REQUIRED"
    let missing = missingURLMarkers.isEmpty ? "none" : missingURLMarkers.joined(separator: ",")
    return "\(status) \(shot.rawValue) \(outputURL.path) \(image.width)x\(image.height) Display-P3 ICC window=\(target.windowID) pid=\(target.ownerPID) url=\(expectedURL.string ?? "") urlOCRMissing=\(missing) capturedAt=\(date)"
}

@main
struct Main {
    static func main() {
        guard CommandLine.arguments.count == 1 else {
            fputs("Usage: hellotext-import-pinned-window-capture\n", stderr)
            exit(64)
        }
        umask(0o077)

        // The process begins only if the original picker-selected ID, Chrome
        // owner, allowed title, layer, and exact bounds still match.
        do {
            let initial = try selectedWindowSnapshot(windowID: target.windowID,
                                                     ownerPID: target.ownerPID)
            guard initial.bounds.equalTo(target.bounds) else {
                throw CaptureError.invalidTarget("Pinned window bounds differ from the original native picker selection")
            }
            print("READY window=\(target.windowID) pid=\(target.ownerPID) title=\(initial.title) bounds=\(NSStringFromRect(initial.bounds)) scale=\(requiredScale)")
            fflush(stdout)
        } catch {
            fputs("Pinned window refused: \(error)\n", stderr)
            exit(1)
        }

        while let command = readLine() {
            if command == "QUIT" {
                print("BYE")
                fflush(stdout)
                return
            }
            guard command.hasPrefix("CAPTURE ") else {
                print("ERROR expected CAPTURE <shot-key> <exact-local-URL> /private/tmp/new.png or QUIT")
                fflush(stdout)
                continue
            }
            let arguments = command.dropFirst("CAPTURE ".count)
                .split(separator: " ", maxSplits: 2, omittingEmptySubsequences: false)
            guard arguments.count == 3, let shot = Shot(rawValue: String(arguments[0])) else {
                print("ERROR expected shot key, exact URL, and output path")
                fflush(stdout)
                continue
            }
            let expectedURL: URLComponents
            let outputURL: URL
            do {
                expectedURL = try validatedExpectedURL(String(arguments[1]), for: shot)
                outputURL = try validatedOutputURL(String(arguments[2]))
            } catch {
                print("ERROR \(error)")
                fflush(stdout)
                continue
            }
            do {
                print(try capture(target: target, shot: shot,
                                  expectedURL: expectedURL, outputURL: outputURL))
                fflush(stdout)
            } catch {
                if (error as? CaptureError)?.canRetryOnPinnedWindow == true {
                    print("RETRYABLE \(error)")
                    fflush(stdout)
                    continue
                }
                print("ERROR \(error)")
                fflush(stdout)
                exit(1)
            }
        }
    }
}
