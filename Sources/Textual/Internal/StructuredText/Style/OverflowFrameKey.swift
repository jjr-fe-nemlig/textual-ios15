import SwiftUI

// MARK: - Overview
//
// OverflowFrameKey collects frame rectangles from scrollable overflow regions (like code blocks)
// and propagates them via preferences to selection overlays.
//
// Text selection uses these frames to exclude scrollable regions from hit-testing so embedded
// ScrollViews can receive touch events while the parent selection interaction ignores them.

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct OverflowFrameKey: PreferenceKey {
  static let defaultValue: [CGRect] = []

  static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
    value.append(contentsOf: nextValue())
  }
}
