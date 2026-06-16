import SwiftUI

/// Applies a font weight.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct FontWeightProperty: TextProperty {
  private let weight: Font.Weight

  /// Creates a font weight property.
  public init(_ weight: Font.Weight) {
    self.weight = weight
  }

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.weight(weight)
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == FontWeightProperty {
  /// Applies the given weight to the font.
  public static func fontWeight(_ weight: Font.Weight) -> Self {
    FontWeightProperty(weight)
  }
}
