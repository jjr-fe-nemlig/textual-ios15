import SwiftUI

/// Uses monospaced digits.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct MonospacedDigitProperty: TextProperty {
  /// Creates a monospaced digit property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.monospacedDigit()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == MonospacedDigitProperty {
  /// Uses monospaced digits.
  public static var monospacedDigit: Self { .init() }
}
