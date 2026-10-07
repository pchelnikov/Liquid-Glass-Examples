import SwiftUI

struct SymbolReplacementExample: View {
  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  @State private var favorite = false

  var body: some View {
    VStack(spacing: 20) {
      DemoBackdrop().frame(height: 220).overlay {
        Button {
          withAnimation(reduceMotion ? nil : .spring(response: 0.35, dampingFraction: 0.7)) {
            favorite.toggle()
          }
        } label: {
          Image(systemName: favorite ? "heart.fill" : "heart")
            .contentTransition(.symbolEffect(.replace))
            .font(.system(size: 40, weight: .medium)).frame(width: 112, height: 112)
        }
        .foregroundStyle(favorite ? .pink : .white)
        .accessibilityLabel(favorite ? "Remove favorite" : "Add favorite")
        .accessibilityValue(favorite ? "Favorite" : "Not favorite")
        .buttonStyle(.plain)
        .glassEffect(.regular.interactive(), in: .circle)
      }
      Text("Tap the heart to replace the symbol with a system animation.")
        .foregroundStyle(.secondary)
    }
  }
}
