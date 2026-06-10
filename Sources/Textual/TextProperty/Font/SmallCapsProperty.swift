import SwiftUI

/// Applies a small caps font variant.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct SmallCapsProperty: TextProperty {
  /// Creates a small caps property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.smallCaps()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == SmallCapsProperty {
  /// Applies a small caps font variant.
  public static var smallCaps: Self { .init() }
}
