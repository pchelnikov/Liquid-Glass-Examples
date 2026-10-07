import SwiftUI

struct AppCompositionExample: View {

    @State private var selected = 0
    @State private var query = ""
    @State private var showNotifications = false

    var body: some View {
        TabView(selection: $selected) {
            Tab("Home", systemImage: "house.fill", value: 0) {
                NavigationStack {
                    List(0..<8, id: \.self) { index in
                        Label("Featured collection \(index + 1)", systemImage: "square.stack")
                    }
                    .navigationTitle("Discover")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                showNotifications = true
                            } label: {
                                Image(systemName: "bell").notificationBadge(3)
                            }
                            .accessibilityLabel("Notifications, 3 unread")
                        }
                    }
                }
            }
            Tab("Favorites", systemImage: "star", value: 1) {
                NavigationStack { ContentUnavailableView("No favorites yet", systemImage: "star") }
            }
            Tab("Search", systemImage: "magnifyingglass", value: 2, role: .search) {
                NavigationStack {
                    List(
                        ["Glass", "Containers", "Transitions"].filter {
                            query.isEmpty || $0.localizedCaseInsensitiveContains(query)
                        }, id: \.self
                    ) { Text($0) }
                        .navigationTitle("Find an example")
                        .searchable(text: $query)
                }
            }
        }
        .alert("Notifications", isPresented: $showNotifications) {
            Button("Done", role: .cancel) {}
        } message: {
            Text("Three new collections are ready to explore.")
        }
        .tabViewBottomAccessory { PlaybackAccessory() }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

extension View {

    fileprivate func notificationBadge(_ count: Int) -> some View {
        overlay(alignment: .topTrailing) {
            Text(count.formatted())
                .font(.caption2.bold()).foregroundStyle(.white)
                .padding(.horizontal, 6).padding(.vertical, 3)
                .background(.red, in: .capsule)
                .offset(x: 8, y: -8)
        }
    }
}
