import Foundation
import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension LayoutDirection {
  static func localeBased(locale: Locale = .current) -> LayoutDirection {
    switch locale.language.characterDirection {
    case .rightToLeft:
      return .rightToLeft
    case .leftToRight:
      return .leftToRight
    case .topToBottom, .bottomToTop, .unknown:
      return .leftToRight
    @unknown default:
      return .leftToRight
    }
  }
}
