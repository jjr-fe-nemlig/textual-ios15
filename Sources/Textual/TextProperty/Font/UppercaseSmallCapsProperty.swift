import SwiftUI

/// Applies an uppercase small caps font variant.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct UppercaseSmallCapsProperty: TextProperty {
  /// Creates an uppercase small caps property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.uppercaseSmallCaps()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == UppercaseSmallCapsProperty {
  /// Applies an uppercase small caps font variant.
  public static var uppercaseSmallCaps: Self { .init() }
}
