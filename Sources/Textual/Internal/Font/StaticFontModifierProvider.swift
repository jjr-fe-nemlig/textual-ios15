import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct StaticFontModifierProvider<Base: FontProvider, Modifier: StaticFontModifier> {
  var base: Base

  init(_: Modifier.Type, base: Base) {
    self.base = base
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension StaticFontModifierProvider: FontProvider {
  var scale: CGFloat {
    get { base.scale }
    set { base.scale = newValue }
  }

  func size(in environment: TextEnvironmentValues) -> CGFloat {
    base.size(in: environment)
  }

  func resolve(in environment: TextEnvironmentValues) -> Font {
    var font = base.resolve(in: environment)
    Modifier().modify(&font)
    return font
  }
}
