import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
@usableFromInline
struct ImageAttachment: Attachment {
  @usableFromInline
  var description: String {
    text
  }

  private let image: Image
  private let text: String

  init(image: Image, text: String) {
    self.image = image
    self.text = text
  }

  @usableFromInline
  var body: some View {
    ImageView(image)
  }

  @usableFromInline
  func sizeThatFits(_ proposal: ProposedViewSize, in _: TextEnvironmentValues) -> CGSize {
    guard let proposedWidth = proposal.width else {
      return image.size
    }

    let size = image.size
    let aspect = size.width / size.height
    let width = min(proposedWidth, size.width)
    let height = width / aspect

    return CGSize(width: width, height: height)
  }

  @usableFromInline
  func pngData() -> Data? {
    image.cgImage.pngData()
  }
}
