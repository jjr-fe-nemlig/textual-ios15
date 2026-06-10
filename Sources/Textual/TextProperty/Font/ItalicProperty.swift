import SwiftUI

/// Applies an italic font trait.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct ItalicProperty: TextProperty {
  /// Creates an italic property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.italic()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == ItalicProperty {
  /// Applies an italic font trait.
  public static var italic: Self { .init() }
}
