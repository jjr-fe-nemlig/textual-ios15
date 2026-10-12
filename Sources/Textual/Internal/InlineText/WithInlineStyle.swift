import SwiftUI

// MARK: - Overview
//
// `WithInlineStyle` applies an `InlineStyle` to an `AttributedString` before it reaches the
// rendering pipeline.
//
// The input `AttributedString` is expected to carry inline semantics using standard Foundation
// attributes:
// - `inlinePresentationIntent` identifies spans like code, emphasis, strong, and strikethrough.
// - `link` identifies URLs.
//
// The view reads `InlineStyle` and `TextEnvironmentValues` from the environment, then produces a
// styled copy of the attributed string by merging attributes into each matching span.
//
// Styling is recomputed whenever the input, style, or environment snapshot changes.

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
struct WithInlineStyle<Content: View>: View {
  @Environment(\.inlineStyle) private var style
  @Environment(\.textEnvironment) private var environment

  @State private var output: AttributedString?

  private let input: AttributedString
  private let content: (AttributedString) -> Content

  init(
    _ input: AttributedString,
    @ViewBuilder content: @escaping (AttributedString) -> Content
  ) {
    self.input = input
    self.content = content
  }

  var body: some View {
    // Resolve synchronously until the cached `output` lands.
    //
    // `.onChange(of:initial:)` does not deliver before the first layout pass, so falling back to an
    // empty `AttributedString` would make that pass measure as if the span held no text at all.
    // Under ordinary SwiftUI hosting that is invisible, but inside a self-sizing
    // `UIHostingConfiguration` cell it is fatal, for the same reason spelled out in
    // ``StructuredText/init(_:parser:)``. The state cannot be seeded in `init` the way
    // `StructuredText` seeds its parse, because `style` and `environment` are read from the
    // environment, which is unavailable there — so the nil case recomputes instead of rendering
    // empty, and `onChange` keeps populating the state as the cheap path for later passes.
    content(output ?? resolved(input, style: style, in: environment))
      .onChange(of: Tuple(input, style, environment), initial: true) { _, newValue in
        output = resolved(
          newValue.values.0,
          style: newValue.values.1,
          in: newValue.values.2
        )
      }
  }

  private func resolved(
    _ attributedString: AttributedString,
    style: InlineStyle,
    in environment: TextEnvironmentValues
  ) -> AttributedString {
    var output = attributedString

    for run in attributedString.runs {
      var attributes = AttributeContainer()

      if let intent = run.inlinePresentationIntent {
        if intent.contains(.code) {
          style.code.apply(in: &attributes, environment: environment)
        }

        if intent.contains(.emphasized) {
          style.emphasis.apply(in: &attributes, environment: environment)
        }

        if intent.contains(.stronglyEmphasized) {
          style.strong.apply(in: &attributes, environment: environment)
        }

        if intent.contains(.strikethrough) {
          style.strikethrough.apply(in: &attributes, environment: environment)
        }
      }

      if run.link != nil {
        style.link.apply(in: &attributes, environment: environment)
      }

      output[run.range].mergeAttributes(attributes, mergePolicy: .keepNew)
    }

    return output
  }
}
