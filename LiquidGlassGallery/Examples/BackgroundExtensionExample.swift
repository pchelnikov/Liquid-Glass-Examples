import SwiftUI

struct BackgroundExtensionExample: View {

    @State private var extended = true

    var body: some View {
        NavigationStack {
            DemoBackdrop(showsCaption: false, cornerRadius: 0)
                .backgroundExtensionEffect(isEnabled: extended)
                .overlay {
                    VStack(spacing: 16) {
                        Image(systemName: "mountain.2.fill").font(.system(size: 80))
                        Text("A wider canvas").font(.largeTitle.bold())
                        Text(
                            "Toggle the extension and watch the artwork continue behind the navigation and bottom bars."
                        )
                        .multilineTextAlignment(.center)
                    }
                    .foregroundStyle(.white)
                    .padding(32)
                }
                .navigationTitle("Extended background")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(
                            extended ? "Disable extension" : "Enable extension",
                            systemImage: "arrow.up.left.and.arrow.down.right"
                        ) {
                            extended.toggle()
                        }
                    }
                }
        }
    }
}
