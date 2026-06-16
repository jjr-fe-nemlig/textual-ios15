@preconcurrency import CoreText
import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct PlatformFontProvider {
  var font: CTFont
  var scale: CGFloat = 1
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension PlatformFontProvider: FontProvider {
  func size(in _: TextEnvironmentValues) -> CGFloat {
    CTFontGetSize(font) * scale
  }

  func resolve(in _: TextEnvironmentValues) -> Font {
    guard scale != 1 else { return Font(font) }
    return Font(CTFont(CTFontCopyFontDescriptor(font), size: CTFontGetSize(font) * scale))
  }
}
