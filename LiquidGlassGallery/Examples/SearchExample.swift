import SwiftUI

struct SearchExample: View {
  private let terms = [
    "Regular glass", "Clear glass", "GlassEffectContainer", "Morphing", "Toolbar", "Tab accessory",
    "Search",
  ]
  @State private var query = ""

  private var results: [String] {
    query.isEmpty ? terms : terms.filter { $0.localizedCaseInsensitiveContains(query) }
  }

  var body: some View {
    NavigationStack {
      List(results, id: \.self) { term in
        Label(term, systemImage: "sparkle.magnifyingglass")
      }
      .overlay {
        if results.isEmpty { ContentUnavailableView.search(text: query) }
      }
      .navigationTitle("Search examples")
      .searchable(text: $query, prompt: "Glass, tabs, morphing…")
      .searchToolbarBehavior(.minimize)
      .toolbar {
        DefaultToolbarItem(kind: .search, placement: .bottomBar)
      }
    }
  }
}
