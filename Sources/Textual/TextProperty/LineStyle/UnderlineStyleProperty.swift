import SwiftUI

/// Applies an underline style attribute.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct UnderlineStyleProperty: TextProperty {
  private let style: Text.LineStyle

  /// Creates an underline style property.
  public init(_ style: Text.LineStyle) {
    self.style = style
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.underlineStyle = style
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == UnderlineStyleProperty {
  /// Underlines text using the given line style.
  public static func underlineStyle(_ style: Text.LineStyle) -> Self {
    UnderlineStyleProperty(style)
  }
}
