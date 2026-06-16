#if TEXTUAL_ENABLE_TEXT_SELECTION && canImport(UIKit)
  import UIKit

  @available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
  final class TextPositionBox: UITextPosition {
    let wrappedValue: TextPosition

    override var description: String {
      wrappedValue.description
    }

    init(_ wrappedValue: TextPosition) {
      self.wrappedValue = wrappedValue
    }
  }
#endif
