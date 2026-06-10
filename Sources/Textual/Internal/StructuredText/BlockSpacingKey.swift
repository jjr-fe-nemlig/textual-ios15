import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension StructuredText {
  struct BlockSpacingKey: PreferenceKey, LayoutValueKey {
    static let defaultValue = BlockSpacing()

    static func reduce(value: inout BlockSpacing, nextValue: () -> BlockSpacing) {
      value = value.union(nextValue())
    }
  }
}
