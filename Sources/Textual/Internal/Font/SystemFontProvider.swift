import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct SystemFontProvider {
  var size: CGFloat
  var weight: Font.Weight?
  var design: Font.Design?
  var scale: CGFloat = 1
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension SystemFontProvider: FontProvider {
  func size(in _: TextEnvironmentValues) -> CGFloat {
    size * scale
  }

  func resolve(in _: TextEnvironmentValues) -> Font {
    Font.system(size: size * scale, weight: weight, design: design)
  }
}
