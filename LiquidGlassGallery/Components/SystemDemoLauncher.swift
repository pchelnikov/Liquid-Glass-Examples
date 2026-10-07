import SwiftUI

/// Presents navigation and tab containers outside the gallery's own navigation stack.
struct SystemDemoLauncher<Content: View>: View {

    let title: String
    @ViewBuilder let content: () -> Content
    @State private var isPresented = GalleryLaunchConfiguration.presentsDemo

    var body: some View {
        DemoPanel(title: "Explore the system interface") {
            Text(
                "Open this example at full size to try its navigation and controls. On iPad, resize the window to explore how the layout adapts."
            )
            .foregroundStyle(.secondary)
            Button("Open demo", systemImage: "arrow.up.left.and.arrow.down.right") {
                isPresented = true
            }
            .buttonStyle(.glassProminent)
        }
        .fullScreenCover(isPresented: $isPresented) {
            VStack(spacing: 0) {
                HStack {
                    Text(title).font(.caption.weight(.semibold)).foregroundStyle(.secondary)
                    Spacer()
                    Button("Close", systemImage: "xmark") { isPresented = false }
                        .labelStyle(.iconOnly)
                        .buttonStyle(.glass)
                        .buttonBorderShape(.circle)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                content()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}
