import SwiftUI

/// Applies a bold font trait.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct BoldProperty: TextProperty {
  /// Creates a bold property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.bold()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == BoldProperty {
  /// Applies a bold font trait.
  public static var bold: Self { .init() }
}
