import SwiftUI

struct DemoBackdrop: View {

    var showsCaption = true
    var cornerRadius: CGFloat = 28

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [.indigo, .blue, .cyan, .mint],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay {
                Circle().fill(.white.opacity(0.22)).frame(width: 150).blur(radius: 1)
                    .offset(x: -110, y: -56)
                Circle().fill(.pink.opacity(0.45)).frame(width: 190)
                    .offset(x: 132, y: 78)
            }
            .overlay(alignment: .bottomLeading) {
                if showsCaption {
                    Text("LIQUID GLASS")
                        .font(.caption2.weight(.bold).monospaced())
                        .tracking(2)
                        .foregroundStyle(.white.opacity(0.76))
                        .padding(20)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .accessibilityHidden(true)
    }
}

struct DemoPanel<Content: View>: View {

    private let title: String
    private let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title).font(.headline)
            content
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background, in: RoundedRectangle(cornerRadius: 24))
    }
}
