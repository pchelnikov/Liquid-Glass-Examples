import SwiftUI

struct MorphingExample: View {
  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  @State private var expanded = false
  @Namespace private var namespace

  var body: some View {
    VStack(spacing: 18) {
      DemoBackdrop().frame(height: 260).overlay {
        GlassEffectContainer(spacing: 28) {
          HStack(spacing: 12) {
            Image(systemName: "pencil.tip.crop.circle")
              .frame(width: 58, height: 58).font(.title2)
              .glassEffect().glassEffectID("primary", in: namespace)
            if expanded {
              Image(systemName: "eraser.fill")
                .frame(width: 58, height: 58).font(.title2)
                .glassEffect().glassEffectID("eraser", in: namespace)
              Image(systemName: "ruler")
                .frame(width: 58, height: 58).font(.title2)
                .glassEffect().glassEffectID("ruler", in: namespace)
            }
          }
          .foregroundStyle(.white)
        }
      }
      Button(expanded ? "Collapse tools" : "Expand tools") {
        withAnimation(reduceMotion ? nil : .spring(response: 0.42, dampingFraction: 0.76)) {
          expanded.toggle()
        }
      }
      .buttonStyle(.glassProminent)
    }
  }
}
