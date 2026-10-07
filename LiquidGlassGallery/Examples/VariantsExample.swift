import SwiftUI

struct VariantsExample: View {

    var body: some View {
        VStack(spacing: 18) {
            DemoBackdrop().frame(height: 220).overlay {
                GlassEffectContainer(spacing: 0) {
                    HStack(spacing: 12) {
                        variantCard("Regular", glass: .regular)
                        variantCard("Clear", glass: .clear)
                        variantCard("Identity", glass: .identity)
                    }
                }
                .padding(14)
            }
            DemoPanel(title: "Variants") {
                Text(
                    "Regular adapts to the background. Clear keeps more of it visible. Identity disables the effect."
                )
                .foregroundStyle(.secondary)
            }
        }
    }

    private func variantCard(_ title: String, glass: Glass) -> some View {
        VStack(spacing: 8) {
            Image(systemName: "sparkle").font(.title2)
            Text(title).font(.caption.weight(.semibold))
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, minHeight: 82)
        .padding(8)
        .glassEffect(glass, in: .rect(cornerRadius: 18))
    }
}
