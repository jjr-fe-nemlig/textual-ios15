import SwiftUI

/// Applies a font leading setting.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct FontLeadingProperty: TextProperty {
  private let leading: Font.Leading

  /// Creates a font leading property.
  public init(_ leading: Font.Leading) {
    self.leading = leading
  }

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.leading(leading)
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == FontLeadingProperty {
  /// Applies the given leading setting to the font.
  public static func fontLeading(_ leading: Font.Leading) -> Self {
    FontLeadingProperty(leading)
  }
}
