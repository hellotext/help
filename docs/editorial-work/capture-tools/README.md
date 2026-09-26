# Native editor capture helper

`hellotext_capture_editor.swift` is the source used for the three Spanish segments pilot images. It captures a rectangle from one exact Chrome window at capture time. The helper refuses ambiguous window targets, rectangles outside the window, density below 2×, missing Display P3 evidence, missing PNG ICC metadata, and existing output paths. It does not save a full-window intermediate.

Compile with the matching Xcode compiler and SDK; the default Command Line Tools compiler and SDK on this host have incompatible Swift patch versions:

```sh
CLANG_MODULE_CACHE_PATH=/private/tmp/hellotext-clang-cache \
SWIFT_MODULE_CACHE_PATH=/private/tmp/hellotext-swift-cache \
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc \
  -parse-as-library \
  -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk \
  -o /private/tmp/hellotext_capture_editor \
  docs/editorial-work/capture-tools/hellotext_capture_editor.swift
```

Run `--list` to identify the window ID, exact title and frame. Before a capture, inspect the target UI and calculate a rectangle containing only the relevant editor or menu. Invoke the helper with `--window-id`, `--title`, `--rect x,y,width,height`, `--output`, and, if display color-space metadata is unavailable, `--display-probe` pointing to a verified native 16 × 16 px Display P3 PNG of an empty 8 × 8 point screen corner. The probe is a local prerequisite and is never published. Recheck the PNG format, pixel size, ICC profile and visible content before using any output in an article.

The helper hides the system cursor by default. Move any browser automation pointer outside the crop and inspect the saved PNG at its original size; an automation overlay can still appear when `showsCursor` is false. Use `--show-cursor` only when the screenshot intentionally highlights a clickable button or link with a visibly enlarged pointer whose tip sits on that target without covering its label. Record the target and pointer treatment in the capture provenance. The older `--hide-cursor` flag remains accepted for existing capture commands but is no longer needed.
