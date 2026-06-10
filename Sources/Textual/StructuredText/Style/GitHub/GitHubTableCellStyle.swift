import SwiftUI

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension StructuredText {
  /// A table cell style inspired by GitHub’s rendering.
  public struct GitHubTableCellStyle: TableCellStyle {
    /// Creates the GitHub table cell style.
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .fontWeight(configuration.row == 0 ? .semibold : .regular)
        .padding(.vertical, 6)
        .padding(.horizontal, 13)
        .textual.lineSpacing(.fontScaled(0.25))
    }
  }
}

@available(iOS 18, macOS 15, tvOS 18, watchOS 11, visionOS 2, *)
extension StructuredText.TableCellStyle where Self == StructuredText.GitHubTableCellStyle {
  /// A GitHub-like table cell style.
  public static var gitHub: Self {
    .init()
  }
}
