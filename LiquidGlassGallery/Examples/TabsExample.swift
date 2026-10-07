import SwiftUI

struct TabsExample: View {
  @State private var selected = 0

  var body: some View {
    TabView(selection: $selected) {
      Tab("Explore", systemImage: "safari", value: 0) {
        tabContent("Explore")
      }
      Tab("Library", systemImage: "books.vertical", value: 1) {
        tabContent("Library")
      }
      Tab("Profile", systemImage: "person.crop.circle", value: 2) {
        tabContent("Profile")
      }
    }
    .tabViewBottomAccessory { PlaybackAccessory() }
    .tabBarMinimizeBehavior(.onScrollDown)
  }

  private func tabContent(_ title: String) -> some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 12) {
          ForEach(0..<14) { index in
            RoundedRectangle(cornerRadius: 18)
              .fill(
                LinearGradient(
                  colors: [.orange.opacity(0.35), .pink.opacity(0.28)], startPoint: .topLeading,
                  endPoint: .bottomTrailing)
              )
              .frame(height: 74)
              .overlay(alignment: .leading) {
                Label("\(title) item \(index + 1)", systemImage: "sparkle")
                  .padding(.horizontal, 18)
              }
          }
        }.padding()
      }
      .navigationTitle(title)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          ShareLink(item: "Explore the \(title) collection") {
            Label("Share collection", systemImage: "square.and.arrow.up")
          }
        }
      }
    }
  }
}
