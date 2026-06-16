import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct NamedFontProvider {
  var name: String
  var size: CGFloat
  var textStyle: Font.TextStyle?
  var scale: CGFloat = 1
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension NamedFontProvider: FontProvider {
  func size(in environment: TextEnvironmentValues) -> CGFloat {
    #if canImport(AppKit)
      return size * scale
    #elseif canImport(UIKit)
      guard let textStyle else { return size * scale }

      return PlatformFont.custom(
        name,
        size: size,
        relativeTo: textStyle,
        in: environment
      ).pointSize * scale
    #endif
  }

  func resolve(in _: TextEnvironmentValues) -> Font {
    if let textStyle {
      return .custom(name, size: size * scale, relativeTo: textStyle)
    } else {
      return .custom(name, fixedSize: size * scale)
    }
  }
}
