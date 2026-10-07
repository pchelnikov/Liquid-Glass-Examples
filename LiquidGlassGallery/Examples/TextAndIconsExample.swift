import SwiftUI

struct TextAndIconsExample: View {

    var body: some View {
        DemoBackdrop().frame(height: 230).overlay {
            GlassEffectContainer(spacing: 8) {
                VStack(spacing: 18) {
                    Text("Glass text")
                        .font(.title.bold()).foregroundStyle(.white)
                        .padding(.horizontal, 24).padding(.vertical, 14)
                        .glassEffect()
                    HStack(spacing: 14) {
                        Label("Photos", systemImage: "photo.fill")
                        Label("Favorites", systemImage: "star.fill")
                    }
                    .font(.subheadline.weight(.semibold)).foregroundStyle(.white)
                    .padding(16).glassEffect(.regular, in: .capsule)
                }
            }
        }
    }
}
