import SwiftUI

/// Sets a foreground (text) color attribute.
@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
public struct ForegroundColorProperty: TextProperty {
  private let color: DynamicColor

  /// Creates a foreground color property using a dynamic color.
  public init(_ color: DynamicColor) {
    self.color = color
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment: TextEnvironmentValues
  ) {
    attributes.foregroundColor = color.bestMatch(for: environment.colorEnvironment)
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension TextProperty where Self == ForegroundColorProperty {
  /// Sets the foreground color using a dynamic color.
  public static func foregroundColor(_ color: DynamicColor) -> Self {
    ForegroundColorProperty(color)
  }

  /// Sets the foreground color using a fixed SwiftUI color.
  public static func foregroundColor(_ color: Color) -> Self {
    ForegroundColorProperty(DynamicColor(color))
  }
}
