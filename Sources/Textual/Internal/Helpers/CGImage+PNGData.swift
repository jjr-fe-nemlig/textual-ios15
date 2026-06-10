import Foundation
import ImageIO
import UniformTypeIdentifiers

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension CGImage {
  func pngData() -> Data? {
    let data = NSMutableData()
    guard
      let destination = CGImageDestinationCreateWithData(
        data,
        UTType.png.identifier as CFString,
        1, nil
      )
    else {
      return nil
    }

    CGImageDestinationAddImage(destination, self, nil)
    CGImageDestinationFinalize(destination)

    return data as Data
  }
}
