import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension StructuredText {
  // NB: Enables environment resolution in `ListItemStyle`
  struct ResolvedListItemStyle<S: ListItemStyle>: View {
    private let style: S
    private let configuration: S.Configuration

    init(_ style: S, configuration: S.Configuration) {
      self.style = style
      self.configuration = configuration
    }

    var body: S.Body {
      style.makeBody(configuration: configuration)
    }
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension StructuredText.ListItemStyle {
  @MainActor func resolve(configuration: Configuration) -> some View {
    StructuredText.ResolvedListItemStyle(self, configuration: configuration)
  }
}
