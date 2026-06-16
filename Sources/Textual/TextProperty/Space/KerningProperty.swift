import Foundation

/// Sets a kern value attribute.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct KerningProperty: TextProperty {
  private let kerning: CGFloat

  /// Creates a kerning property.
  public init(_ kerning: CGFloat) {
    self.kerning = kerning
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.kern = kerning
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == KerningProperty {
  /// Sets the kern value.
  public static func kerning(_ kerning: CGFloat) -> Self {
    KerningProperty(kerning)
  }
}
