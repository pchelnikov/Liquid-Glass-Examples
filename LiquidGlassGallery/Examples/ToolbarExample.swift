import SwiftUI

struct ToolbarExample: View {

    @State private var itemCount = 8
    @State private var filtered = false

    var body: some View {
        NavigationStack {
            List((1...itemCount).filter { !filtered || $0.isMultiple(of: 2) }, id: \.self) { index in
                Label("Example content \(index)", systemImage: "square.text.square")
            }
            .navigationTitle(filtered ? "Even items" : "Toolbar")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(
                        filtered ? "Show all" : "Filter even items", systemImage: "line.3.horizontal.decrease"
                    ) {
                        filtered.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add item", systemImage: "plus") { itemCount += 1 }
                        .buttonStyle(.glassProminent)
                }
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("More", systemImage: "ellipsis") {
                        Button("Reset items", systemImage: "arrow.counterclockwise") {
                            itemCount = 8
                            filtered = false
                        }
                    }
                }
                .sharedBackgroundVisibility(.hidden)
                ToolbarItem(placement: .bottomBar) {
                    Text("\(itemCount) items").font(.caption).foregroundStyle(.secondary).fixedSize()
                }
                ToolbarItem(placement: .bottomBar) {
                    ShareLink(item: "My gallery has \(itemCount) example items")
                }
            }
        }
    }
}
