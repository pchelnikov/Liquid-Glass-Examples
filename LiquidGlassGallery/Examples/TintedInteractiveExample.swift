import SwiftUI

struct TintedInteractiveExample: View {

    @State private var liked = false
    @State private var bookmarked = false

    var body: some View {
        DemoBackdrop().frame(height: 250).overlay {
            GlassEffectContainer(spacing: 18) {
                HStack(spacing: 18) {
                    Button {
                        liked.toggle()
                    } label: {
                        Label(liked ? "Liked" : "Like", systemImage: liked ? "heart.fill" : "heart")
                            .padding(.horizontal, 20).padding(.vertical, 14)
                    }
                    .accessibilityValue(liked ? "Liked" : "Not liked")
                    .glassEffect(.regular.tint(liked ? .pink : .clear).interactive(), in: .capsule)

                    Button {
                        bookmarked.toggle()
                    } label: {
                        Image(systemName: bookmarked ? "bookmark.fill" : "bookmark")
                            .frame(width: 50, height: 50)
                    }
                    .accessibilityLabel(bookmarked ? "Remove bookmark" : "Add bookmark")
                    .tint(.orange)
                    .glassEffect(.regular.tint(.orange).interactive(), in: .circle)
                }
            }
            .buttonStyle(.plain)
            .foregroundStyle(.white)
        }
    }
}
