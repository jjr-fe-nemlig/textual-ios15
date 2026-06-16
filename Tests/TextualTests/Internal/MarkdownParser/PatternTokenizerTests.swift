import Foundation
import Testing

@testable import Textual

struct PatternTokenizerTests {
  @Test func text() throws {
    // given
    let tokenizer = PatternTokenizer(patterns: [.emoji])

    // when
    let tokens = try tokenizer.tokenize("Hello world")

    // then
    #expect(
      tokens == [
        .init(type: .text, content: "Hello world")
      ]
    )
  }

  @Test func emoji() throws {
    // given
    let tokenizer = PatternTokenizer(patterns: [.emoji])

    // when
    let tokens = try tokenizer.tokenize("Hello :smile: and :heart: world")

    // then
    #expect(
      tokens == [
        .init(type: .text, content: "Hello "),
        .init(type: .emoji, content: ":smile:", capturedContent: "smile"),
        .init(type: .text, content: " and "),
        .init(type: .emoji, content: ":heart:", capturedContent: "heart"),
        .init(type: .text, content: " world"),
      ]
    )
  }

  @Test func adjacentEmoji() throws {
    // given
    let tokenizer = PatternTokenizer(patterns: [.emoji])

    // when
    let tokens = try tokenizer.tokenize("Hello :smile::heart: world")

    // then
    #expect(
      tokens == [
        .init(type: .text, content: "Hello "),
        .init(type: .emoji, content: ":smile:", capturedContent: "smile"),
        .init(type: .emoji, content: ":heart:", capturedContent: "heart"),
        .init(type: .text, content: " world"),
      ]
    )
  }

  @Test func incompleteEmoji() throws {
    // given
    let tokenizer = PatternTokenizer(patterns: [.emoji])

    // when
    let tokens = try tokenizer.tokenize("Hello :smile")

    // then
    #expect(
      tokens == [
        .init(type: .text, content: "Hello :smile")
      ]
    )
  }

  @Test func emptyEmoji() throws {
    // given
    let tokenizer = PatternTokenizer(patterns: [.emoji])

    // when
    let tokens = try tokenizer.tokenize("Hello :: world")

    // then
    #expect(
      tokens == [
        .init(type: .text, content: "Hello :: world")
      ]
    )
  }

  @Test func invalidEmoji() throws {
    // given
    let tokenizer = PatternTokenizer(patterns: [.emoji])

    // when
    let tokens = try tokenizer.tokenize("Hello :not emoji: :notemoji!: world")

    // then
    #expect(
      tokens == [
        .init(type: .text, content: "Hello :not emoji: :notemoji!: world")
      ]
    )
  }

  @Test func preservesNewlines() throws {
    // given
    let tokenizer = PatternTokenizer(patterns: [.emoji])

    // when
    let tokens = try tokenizer.tokenize(
      """
      Some line
      Hello :smile: and :heart: world
      Another line
      """
    )

    // then
    #expect(
      tokens == [
        .init(type: .text, content: "Some line\nHello "),
        .init(type: .emoji, content: ":smile:", capturedContent: "smile"),
        .init(type: .text, content: " and "),
        .init(type: .emoji, content: ":heart:", capturedContent: "heart"),
        .init(type: .text, content: " world\nAnother line"),
      ]
    )
  }

}
