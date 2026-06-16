import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension EnvironmentValues {
  @Entry var listItemSpacing: FontScaled<StructuredText.BlockSpacing> = .fontScaled(top: 0.25)
  @Entry var resolvedListItemSpacing: StructuredText.BlockSpacing = .init()
  @Entry var listItemSpacingEnabled: Bool = false
}
