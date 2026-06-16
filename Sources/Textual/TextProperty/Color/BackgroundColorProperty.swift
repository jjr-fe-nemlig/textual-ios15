import SwiftUI

/// Sets a background color attribute.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct BackgroundColorProperty: TextProperty {
  private let color: DynamicColor

  /// Creates a background color property using a dynamic color.
  public init(_ color: DynamicColor) {
    self.color = color
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment: TextEnvironmentValues
  ) {
    attributes.backgroundColor = color.bestMatch(for: environment.colorEnvironment)
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == BackgroundColorProperty {
  /// Sets the background color using a dynamic color.
  public static func backgroundColor(_ color: DynamicColor) -> Self {
    BackgroundColorProperty(color)
  }

  /// Sets the background color using a fixed SwiftUI color.
  public static func backgroundColor(_ color: Color) -> Self {
    BackgroundColorProperty(DynamicColor(color))
  }
}
