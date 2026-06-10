import SwiftUI

/// Uses a monospaced font design.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct MonospacedProperty: TextProperty {
  /// Creates a monospaced property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.monospaced()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == MonospacedProperty {
  /// Uses a monospaced font design.
  public static var monospaced: Self { .init() }
}
