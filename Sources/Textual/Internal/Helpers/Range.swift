import Foundation

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension Range where Bound == Int {
  func offset(by amount: Int) -> Range<Int> {
    (lowerBound + amount)..<(upperBound + amount)
  }
}
