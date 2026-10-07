import SwiftUI

struct ContainersExample: View {
  @State private var gap = 12.0
  @State private var blendingDistance = 30.0

  var body: some View {
    VStack(spacing: 18) {
      DemoBackdrop().frame(height: 230).overlay {
        GlassEffectContainer(spacing: blendingDistance) {
          HStack(spacing: gap) {
            ForEach(["pencil", "eraser", "lasso"], id: \.self) { symbol in
              Image(systemName: symbol)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 54, height: 54)
                .glassEffect(.regular, in: .circle)
            }
          }
        }
      }
      DemoPanel(title: "Explore blending") {
        LabeledContent("Gap between shapes", value: "\(Int(gap)) pt")
        Slider(value: $gap, in: 4...40).accessibilityLabel("Gap between shapes")
        LabeledContent("Container spacing", value: "\(Int(blendingDistance)) pt")
        Slider(value: $blendingDistance, in: 0...60).accessibilityLabel("Container spacing")
        Text(
          "Blending begins as the gap becomes smaller than the container spacing. Try moving either slider."
        )
        .font(.caption).foregroundStyle(.secondary)
      }
    }
  }
}
