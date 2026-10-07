import SwiftUI

struct DynamicAdaptationExample: View {

    var body: some View {
        VStack(spacing: 18) {
            adaptationCard(
                title: "Light scene", style: .light,
                colors: [.white, .gray.opacity(0.25), .mint.opacity(0.45)])
            adaptationCard(
                title: "Dark scene", style: .dark,
                colors: [.black, .indigo.opacity(0.8), .purple.opacity(0.7)])
            Text(
                "Each preview sets its own color scheme so you can compare light and dark glass side by side."
            )
            .font(.caption).foregroundStyle(.secondary)
        }
    }

    private func adaptationCard(title: String, style: ColorScheme, colors: [Color]) -> some View {
        RoundedRectangle(cornerRadius: 24).fill(
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .frame(height: 150).overlay(alignment: .center) {
            Label(title, systemImage: style == .light ? "sun.max.fill" : "moon.fill")
                .font(.headline).padding(.horizontal, 22).padding(.vertical, 16)
                .glassEffect(.regular, in: .capsule)
        }.environment(\.colorScheme, style)
    }
}
