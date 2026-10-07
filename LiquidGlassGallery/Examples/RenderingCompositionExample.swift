import SwiftUI

struct RenderingCompositionExample: View {
  var body: some View {
    VStack(spacing: 18) {
      RenderingSample(
        title: "Separate effects",
        explanation: "Apply the modifier to each control.",
        code: """
          Image(systemName: symbol)
            .frame(width: 48, height: 48)
            .glassEffect(.regular, in: .circle)
          """,
        usesSharedContainer: false
      )
      RenderingSample(
        title: "Shared container",
        explanation: "Wrap those controls in one container.",
        code: """
          GlassEffectContainer(spacing: 0) {
            controls
          }
          """,
        usesSharedContainer: true
      )
      Text(
        "The appearance stays the same here. A shared container combines nearby glass rendering, while its spacing controls shape blending. This example shows composition, not measured performance."
      )
      .font(.caption).foregroundStyle(.secondary)
    }
  }

}

private struct RenderingSample: View {
  let title: String
  let explanation: String
  let code: String
  let usesSharedContainer: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      VStack(alignment: .leading, spacing: 4) {
        Text(title).font(.headline)
        Text(explanation).font(.caption).foregroundStyle(.secondary)
      }
      DemoBackdrop().frame(height: 128).overlay {
        let controls = HStack(spacing: 10) {
          ForEach(["pencil", "eraser", "lasso", "crop.rotate"], id: \.self) { symbol in
            Image(systemName: symbol).frame(width: 48, height: 48).glassEffect(
              .regular, in: .circle)
          }
        }.foregroundStyle(.white)
        if usesSharedContainer {
          GlassEffectContainer(spacing: 0) { controls }
        } else {
          controls
        }
      }
      Text(code)
        .font(.system(.caption, design: .monospaced))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.primary.opacity(0.045), in: RoundedRectangle(cornerRadius: 12))
    }.padding(16).frame(maxWidth: .infinity, alignment: .leading)
      .background(.background, in: RoundedRectangle(cornerRadius: 22))
  }
}
