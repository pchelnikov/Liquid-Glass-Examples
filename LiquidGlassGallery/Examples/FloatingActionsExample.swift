import SwiftUI

struct FloatingActionsExample: View {

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var expanded = false
    @State private var pinned = false
    @Namespace private var namespace

    var body: some View {
        DemoBackdrop().frame(height: 330).overlay(alignment: .bottomTrailing) {
            GlassEffectContainer(spacing: 12) {
                VStack(alignment: .trailing, spacing: 16) {
                    if expanded {
                        Button(pinned ? "Unpin" : "Pin", systemImage: pinned ? "pin.slash" : "pin.fill") {
                            pinned.toggle()
                        }
                        .buttonStyle(.glass)
                        .glassEffectID("pin", in: namespace)
                        ShareLink(item: "Explore the Liquid Glass Gallery") {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                        .buttonStyle(.glass)
                        .glassEffectID("share", in: namespace)
                    }
                    Button(
                        expanded ? "Close actions" : "Open actions", systemImage: expanded ? "xmark" : "plus"
                    ) {
                        withAnimation(reduceMotion ? nil : .spring(response: 0.38, dampingFraction: 0.78)) {
                            expanded.toggle()
                        }
                    }
                    .labelStyle(.iconOnly)
                    .font(.title3.weight(.semibold))
                    .frame(width: 58, height: 58)
                    .buttonStyle(.plain)
                    .glassEffect(.regular.interactive(), in: .circle)
                    .glassEffectID("primary-action", in: namespace)
                }
                .padding(20)
                .foregroundStyle(.white)
            }
        }
    }
}
