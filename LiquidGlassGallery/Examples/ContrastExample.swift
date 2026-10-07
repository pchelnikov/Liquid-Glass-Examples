import SwiftUI

struct ContrastExample: View {
  var body: some View {
    VStack(spacing: 18) {
      scene(title: "Calm background", colors: [.indigo, .blue, .cyan])
      scene(title: "Busy background", colors: [.red, .orange, .yellow, .green, .blue, .purple])
      gradientFadeScene
      Text("Keep glass in the control layer and preserve contrast over changing content.")
        .font(.caption).foregroundStyle(.secondary)
    }
  }

  private var gradientFadeScene: some View {
    RoundedRectangle(cornerRadius: 24)
      .fill(
        LinearGradient(
          colors: [.teal, .cyan, .yellow, .orange], startPoint: .topLeading,
          endPoint: .bottomTrailing)
      )
      .frame(height: 150)
      .overlay {
        LinearGradient(
          colors: [.clear, .black.opacity(0.62)], startPoint: .center, endPoint: .bottom
        )
        .clipShape(RoundedRectangle(cornerRadius: 24))
      }
      .overlay(alignment: .bottom) {
        HStack {
          Text("Gradient fade + dimming").font(.subheadline.weight(.semibold))
          Spacer()
          Image(systemName: "ellipsis")
        }
        .foregroundStyle(.primary)
        .padding(.horizontal, 18).padding(.vertical, 13)
        .glassEffect(.regular, in: .capsule)
        .padding(12)
      }
  }

  private func scene(title: String, colors: [Color]) -> some View {
    RoundedRectangle(cornerRadius: 24)
      .fill(AngularGradient(colors: colors, center: .center))
      .frame(height: 140)
      .overlay(alignment: .bottom) {
        HStack {
          Text(title).font(.subheadline.weight(.semibold))
          Spacer()
          Image(systemName: "ellipsis").font(.headline)
        }
        .foregroundStyle(.primary)
        .padding(.horizontal, 18).padding(.vertical, 13)
        .glassEffect(.regular, in: .capsule)
        .padding(12)
      }
  }
}
