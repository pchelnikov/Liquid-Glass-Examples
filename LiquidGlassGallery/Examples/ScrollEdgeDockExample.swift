import SwiftUI

struct ScrollEdgeDockExample: View {

    @State private var savedOnly = false
    @State private var hardEdge = false
    private let saved = [2, 5, 8]

    var body: some View {
        VStack(spacing: 18) {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach((1...12).filter { !savedOnly || saved.contains($0) }, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    colors: [.indigo, .blue, .teal], startPoint: .topLeading,
                                    endPoint: .bottomTrailing)
                            )
                            .frame(height: 120)
                            .overlay(alignment: .bottomLeading) {
                                Label(
                                    "Trail \(index)",
                                    systemImage: saved.contains(index) ? "bookmark.fill" : "mountain.2"
                                )
                                .font(.headline).foregroundStyle(.white).padding(20)
                            }
                    }
                }.padding(16)
            }
            .safeAreaBar(edge: .bottom) {
                HStack(spacing: 16) {
                    Label(savedOnly ? "Saved trails" : "All trails", systemImage: "map")
                        .font(.subheadline.weight(.semibold))
                    Spacer(minLength: 8)
                    Button(
                        savedOnly ? "Show all" : "Saved",
                        systemImage: savedOnly ? "line.3.horizontal" : "bookmark"
                    ) {
                        savedOnly.toggle()
                    }
                    .buttonStyle(.glass)
                }
                .padding(16)
            }
            .scrollEdgeEffectStyle(hardEdge ? .hard : .soft, for: .bottom)
            .frame(height: 430)
            .clipShape(RoundedRectangle(cornerRadius: 28))
            Toggle("Hard scroll edge", isOn: $hardEdge)
            Text(
                "Scroll the trails beneath the dock, then compare soft and hard edge treatments. The safe-area bar reserves space so the final row remains reachable."
            )
            .font(.caption).foregroundStyle(.secondary)
        }
    }
}

#Preview { ExampleDetailView(example: .scrollEdgeDock) }
