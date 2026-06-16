import SwiftUI

/// Replaces the font attribute.
///
/// Pass `nil` to clear any explicit font and let the surrounding style decide.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct FontProperty: TextProperty {
  private let font: Font?

  /// Creates a font property.
  public init(_ font: Font?) {
    self.font = font
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.font = font
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == FontProperty {
  /// Sets the font attribute.
  public static func font(_ font: Font?) -> Self {
    FontProperty(font)
  }
}
