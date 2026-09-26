import Foundation
import CoreGraphics
import ImageIO
import ScreenCaptureKit
import UniformTypeIdentifiers

// One-shot, fail-closed capture of a rectangle of one exact Google Chrome window.
// Coordinates are global macOS screen points, as reported by SCWindow.frame.
// This program never saves a full-window or full-display intermediate.

enum CaptureError: Error, CustomStringConvertible {
    case usage(String)
    case invalid(String)

    var description: String {
        switch self {
        case .usage(let value), .invalid(let value): return value
        }
    }
}

struct Options {
    var list = false
    var showCursor = false
    var windowID: UInt32?
    var title: String?
    var rect: CGRect?
    var output: URL?
    var displayProbe: URL?
}

func parseOptions() throws -> Options {
    let arguments = Array(CommandLine.arguments.dropFirst())
    var result = Options()
    var index = 0
    while index < arguments.count {
        let arg = arguments[index]
        if arg == "--list" {
            result.list = true
            index += 1
            continue
        }
        if arg == "--hide-cursor" {
            result.showCursor = false
            index += 1
            continue
        }
        if arg == "--show-cursor" {
            result.showCursor = true
            index += 1
            continue
        }
        guard index + 1 < arguments.count else { throw CaptureError.usage("Missing value for \(arg)") }
        let value = arguments[index + 1]
        switch arg {
        case "--window-id":
            guard let number = UInt32(value) else { throw CaptureError.usage("Invalid window ID") }
            result.windowID = number
        case "--title":
            guard !value.isEmpty else { throw CaptureError.usage("Empty window title") }
            result.title = value
        case "--rect":
            let parts = value.split(separator: ",").compactMap { Double($0) }
            guard parts.count == 4, parts[2] > 0, parts[3] > 0,
                  parts.allSatisfy(\.isFinite) else {
                throw CaptureError.usage("Rect must be x,y,width,height in global screen points")
            }
            result.rect = CGRect(x: parts[0], y: parts[1], width: parts[2], height: parts[3])
        case "--output":
            guard value.hasSuffix(".png") else { throw CaptureError.usage("Output must end in .png") }
            result.output = URL(fileURLWithPath: value).standardizedFileURL
        case "--display-probe":
            result.displayProbe = URL(fileURLWithPath: value).standardizedFileURL
        default:
            throw CaptureError.usage("Unknown option: \(arg)")
        }
        index += 2
    }
    if !result.list {
        guard result.windowID != nil, result.title != nil, result.rect != nil, result.output != nil else {
            throw CaptureError.usage("Capture requires --window-id N --title EXACT_TITLE --rect x,y,w,h --output /absolute/path.png [--display-probe /absolute/path.png] [--show-cursor]")
        }
    }
    return result
}

func contains(_ outer: CGRect, _ inner: CGRect) -> Bool {
    let epsilon: CGFloat = 0.1
    return inner.minX >= outer.minX - epsilon && inner.minY >= outer.minY - epsilon &&
           inner.maxX <= outer.maxX + epsilon && inner.maxY <= outer.maxY + epsilon
}

func isDisplayP3(_ space: CGColorSpace?) -> Bool {
    guard let name = space?.name as String? else { return false }
    return name == CGColorSpace.displayP3 as String
}

func pngHasICC(_ data: Data) -> Bool {
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

func verifyNativeDisplayProbe(_ url: URL) throws {
    let data = try Data(contentsOf: url)
    guard pngHasICC(data),
          let source = CGImageSourceCreateWithURL(url as CFURL, nil),
          CGImageSourceGetType(source) as String? == UTType.png.identifier,
          let image = CGImageSourceCreateImageAtIndex(source, 0, nil),
          image.width == 16, image.height == 16,
          isDisplayP3(image.colorSpace) else {
        throw CaptureError.invalid("Display probe is not a 16x16 native 2x PNG with embedded Display P3 ICC")
    }
}

@main
struct CaptureEditor {
    static func main() async {
        do {
            try await run()
        } catch {
            fputs("Capture refused: \(error)\n", stderr)
            exit(1)
        }
    }

    static func run() async throws {
        let options = try parseOptions()
        let content = try await SCShareableContent.excludingDesktopWindows(false, onScreenWindowsOnly: true)
        let chrome = content.windows.filter {
            $0.owningApplication?.bundleIdentifier == "com.google.Chrome" && $0.windowLayer == 0
        }

        if options.list {
            for display in content.displays {
                let displaySpace = CGDisplayCopyColorSpace(display.displayID)
                print("display=\(display.displayID) frame=\(display.frame) colorSpace=\(displaySpace.name as String? ?? "<none>")")
            }
            for window in chrome.sorted(by: { $0.windowID < $1.windowID }) {
                print("id=\(window.windowID) title=\(window.title ?? "<none>") frame=\(window.frame)")
            }
            return
        }

        let matches = chrome.filter { $0.windowID == options.windowID && $0.title == options.title }
        guard matches.count == 1, let window = matches.first else {
            throw CaptureError.invalid("Chrome window ID and exact title did not resolve uniquely")
        }
        let rect = options.rect!
        guard contains(window.frame, rect) else {
            throw CaptureError.invalid("Capture rectangle is not wholly inside the selected Chrome window")
        }
        let matchingDisplays = content.displays.filter { contains($0.frame, rect) }
        guard matchingDisplays.count == 1, let display = matchingDisplays.first else {
            throw CaptureError.invalid("Capture rectangle is not wholly inside exactly one display")
        }
        let displaySpace = CGDisplayCopyColorSpace(display.displayID)
        if !isDisplayP3(displaySpace) {
            guard let probeURL = options.displayProbe else {
                throw CaptureError.invalid("Display color space metadata unavailable; pass a verified 8x8-point native screencapture PNG via --display-probe")
            }
            try verifyNativeDisplayProbe(probeURL)
        }
        let outputURL = options.output!
        guard outputURL.path.hasPrefix("/"), !FileManager.default.fileExists(atPath: outputURL.path) else {
            throw CaptureError.invalid("Output path must be absolute and must not already exist")
        }
        guard FileManager.default.fileExists(atPath: outputURL.deletingLastPathComponent().path) else {
            throw CaptureError.invalid("Output directory does not exist")
        }

        let filter = SCContentFilter(display: display, including: [window])
        let scale = CGFloat(filter.pointPixelScale)
        guard scale >= 2 else { throw CaptureError.invalid("Display density is below 2x (\(scale))") }
        let pixelWidth = Int((rect.width * scale).rounded())
        let pixelHeight = Int((rect.height * scale).rounded())
        guard pixelWidth >= 1, pixelHeight >= 1 else { throw CaptureError.invalid("Invalid pixel dimensions") }

        let config = SCStreamConfiguration()
        config.sourceRect = rect.offsetBy(dx: -display.frame.minX, dy: -display.frame.minY)
        config.width = pixelWidth
        config.height = pixelHeight
        config.showsCursor = options.showCursor
        config.includeChildWindows = false
        config.ignoreShadowsDisplay = true
        config.colorSpaceName = CGColorSpace.displayP3

        let image = try await SCScreenshotManager.captureImage(contentFilter: filter, configuration: config)
        guard image.width == pixelWidth, image.height == pixelHeight else {
            throw CaptureError.invalid("Unexpected image dimensions: \(image.width)x\(image.height), expected \(pixelWidth)x\(pixelHeight)")
        }
        guard isDisplayP3(image.colorSpace) else {
            throw CaptureError.invalid("Captured CGImage is not native Display P3: \(image.colorSpace?.name as String? ?? "<none>")")
        }

        // ImageIO writes only the already cropped CGImage. No full-frame file is created.
        guard let destination = CGImageDestinationCreateWithURL(outputURL as CFURL, UTType.png.identifier as CFString, 1, nil) else {
            throw CaptureError.invalid("Unable to create PNG destination")
        }
        CGImageDestinationAddImage(destination, image, nil)
        guard CGImageDestinationFinalize(destination) else {
            try? FileManager.default.removeItem(at: outputURL)
            throw CaptureError.invalid("Unable to finalize PNG")
        }
        let data = try Data(contentsOf: outputURL)
        guard pngHasICC(data) else {
            try? FileManager.default.removeItem(at: outputURL)
            throw CaptureError.invalid("PNG has no embedded iCCP profile; removed")
        }
        guard let source = CGImageSourceCreateWithURL(outputURL as CFURL, nil),
              CGImageSourceGetType(source) as String? == UTType.png.identifier,
              let saved = CGImageSourceCreateImageAtIndex(source, 0, nil),
              saved.width == pixelWidth, saved.height == pixelHeight,
              isDisplayP3(saved.colorSpace) else {
            try? FileManager.default.removeItem(at: outputURL)
            throw CaptureError.invalid("Saved PNG failed format, size or Display P3 recheck; removed")
        }
        print("Saved cropped native PNG: \(outputURL.path) \(pixelWidth)x\(pixelHeight) scale=\(scale) profile=Display P3 windowID=\(window.windowID)")
    }
}
