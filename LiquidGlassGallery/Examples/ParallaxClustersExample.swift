import SwiftUI

struct ParallaxClustersExample: View {
  @State private var separation = 34.0

  var body: some View {
    VStack(spacing: 22) {
      DemoBackdrop().frame(height: 310).overlay {
        VStack(spacing: 34) {
          GlassEffectContainer(spacing: 42) {
            HStack(spacing: 0) {
              clusterSymbol("scribble.variable", offset: -separation / 2)
              clusterSymbol("eraser.fill", offset: separation / 2)
            }
            .foregroundStyle(.white)
          }
          GlassEffectContainer(spacing: 18) {
            HStack(spacing: 12) {
              clusterLabel("Warm", symbol: "sun.max.fill", color: .orange)
              clusterLabel("Cool", symbol: "snowflake", color: .cyan)
            }
          }
        }
      }
      VStack(alignment: .leading, spacing: 10) {
        HStack {
          Text("Control spacing")
          Spacer()
          Text("\(Int(separation)) pt").monospacedDigit().foregroundStyle(.secondary)
        }.font(.subheadline.weight(.medium))
        Slider(value: $separation, in: 0...90)
        Text("The two shapes blend as they move within the shared container.")
          .font(.caption).foregroundStyle(.secondary)
      }
    }
  }

  private func clusterSymbol(_ name: String, offset: Double) -> some View {
    Image(systemName: name)
      .font(.system(size: 36, weight: .medium))
      .frame(width: 88, height: 88)
      .glassEffect(.regular, in: .circle)
      .offset(x: offset)
  }

  private func clusterLabel(_ title: String, symbol: String, color: Color) -> some View {
    Label(title, systemImage: symbol).font(.subheadline.weight(.semibold))
      .padding(.horizontal, 16).padding(.vertical, 12)
      .glassEffect(.regular.tint(color), in: .capsule)
      .foregroundStyle(.white)
  }
}
