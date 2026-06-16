import Foundation

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension AttributedStringMarkdownParser {
  /// A syntax extension that replaces matched tokens after Markdown parsing.
  public struct SyntaxExtension {
    let patterns: [PatternTokenizer.Pattern]
    let replace:
      (
        _ token: PatternTokenizer.Token,
        _ attributes: AttributeContainer
      ) -> AttributedString?
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension AttributedStringMarkdownParser.SyntaxExtension {
  /// Replaces `:shortcode:` sequences using the provided custom emoji definitions.
  public static func emoji(_ emoji: Set<Emoji>) -> Self {
    guard !emoji.isEmpty else {
      return Self(patterns: [], replace: { _, _ in nil })
    }

    let emojiMap = Dictionary(
      uniqueKeysWithValues: emoji.map { emoji in
        (emoji.shortcode, emoji)
      }
    )

    return Self(patterns: [.emoji]) { token, attributes in
      guard let shortcode = token.capturedContent, let emoji = emojiMap[shortcode] else {
        return nil
      }

      return AttributedString(
        shortcode,
        attributes: attributes.emojiURL(emoji.url)
      )
    }
  }
}
