import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension StructuredText {
  struct Heading: View {
    @Environment(\.headingStyle) private var headingStyle

    private let content: AttributedSubstring
    private let level: Int

    init(_ content: AttributedSubstring, level: Int) {
      self.content = content
      self.level = level
    }

    var body: some View {
      let configuration = HeadingStyleConfiguration(
        label: .init(label),
        indentationLevel: indentationLevel,
        headingLevel: level
      )
      let resolvedStyle = headingStyle.resolve(configuration: configuration)

      AnyView(resolvedStyle)
        .id(content.slugified())
    }

    private var label: some View {
      WithInlineStyle(AttributedString(content)) {
        TextFragment($0)
      }
    }

    private var indentationLevel: Int {
      content.presentationIntent?.indentationLevel ?? 0
    }
  }
}
