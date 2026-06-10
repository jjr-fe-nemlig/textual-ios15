import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension StructuredText.HighlighterTheme {
  /// A minimal theme that applies only base foreground and background colors.
  public static let plain = Self(
    foregroundColor: .codePlain,
    backgroundColor: .codeBackground
  )
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension DynamicColor {
  static let codePlain = DynamicColor(
    light: Color(red: 0, green: 0, blue: 0, opacity: 0.85),
    dark: Color(red: 1, green: 1, blue: 1, opacity: 0.85)
  )

  static let codeBackground = DynamicColor(
    light: Color(red: 0.960784, green: 0.960784, blue: 0.968627),
    dark: Color(red: 0.120543, green: 0.122844, blue: 0.141312)
  )
}
