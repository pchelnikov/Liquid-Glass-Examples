import SwiftUI

struct UnionsExample: View {
  @Namespace private var namespace

  var body: some View {
    VStack(spacing: 18) {
      DemoBackdrop().frame(height: 200).overlay {
        GlassEffectContainer(spacing: 20) {
          HStack(spacing: 20) {
            unionButton("Edit", symbol: "pencil", id: "tools")
            unionButton("Delete", symbol: "trash", id: "tools")
            unionButton("Share", symbol: "square.and.arrow.up", id: "share")
          }
        }
        .foregroundStyle(.white)
      }
      Text(
        "Pencil and trash share one union identifier, so they form a single surface. Share uses a different identifier and stays separate."
      )
      .font(.caption).foregroundStyle(.secondary)
    }
  }

  private func unionButton(_ title: String, symbol: String, id: String) -> some View {
    Image(systemName: symbol)
      .font(.title3.weight(.semibold))
      .frame(width: 64, height: 52)
      .accessibilityLabel(title)
      .glassEffect(.regular, in: .capsule)
      .glassEffectUnion(id: id, namespace: namespace)
  }
}
