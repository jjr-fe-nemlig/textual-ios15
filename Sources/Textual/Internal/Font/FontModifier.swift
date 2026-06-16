import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
protocol FontModifier: Sendable, Hashable {
  func modify(_ font: inout Font)
  func modify(_ size: inout CGFloat)
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension FontModifier {
  func modify(_ size: inout CGFloat) {
    // do nothing
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct WeightFontModifier: FontModifier {
  var weight: Font.Weight

  func modify(_ font: inout Font) {
    font = font.weight(weight)
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct WidthFontModifier: FontModifier {
  var width: Font.Width

  func modify(_ font: inout Font) {
    font = font.width(width)
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct LeadingFontModifier: FontModifier {
  var leading: Font.Leading

  func modify(_ font: inout Font) {
    font = font.leading(leading)
  }
}

#if compiler(>=6.2)
  @available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
  @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
  struct ScaleFontModifier: FontModifier {
    var scaleFactor: CGFloat

    func modify(_ font: inout Font) {
      font = font.scaled(by: scaleFactor)
    }

    // NB: Modify both font and size so that measurements match rendering.
    //     FontProvider.size(in:) must return the actual rendered size.
    func modify(_ size: inout CGFloat) {
      size *= scaleFactor
    }
  }
#endif

// MARK: - Static font modifiers

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
protocol StaticFontModifier: FontModifier {
  init()
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct BoldFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.bold()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct ItalicFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.italic()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct MonospacedFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.monospaced()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct MonospacedDigitFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.monospacedDigit()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct LowercaseSmallCapsFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.lowercaseSmallCaps()
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct UppercaseSmallCapsFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.uppercaseSmallCaps()
  }
}
