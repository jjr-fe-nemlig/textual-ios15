import Foundation

/// Sets a baseline offset attribute.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct BaselineOffsetProperty: TextProperty {
  private let offset: CGFloat

  /// Creates a baseline offset property.
  public init(_ offset: CGFloat) {
    self.offset = offset
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.baselineOffset = offset
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == BaselineOffsetProperty {
  /// Sets the baseline offset.
  public static func baselineOffset(_ offset: CGFloat) -> Self {
    BaselineOffsetProperty(offset)
  }
}
