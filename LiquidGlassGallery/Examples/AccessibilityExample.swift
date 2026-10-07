import SwiftUI

struct AccessibilityExample: View {

    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.accessibilityDifferentiateWithoutColor) private var differentiateWithoutColor

    var body: some View {
        VStack(spacing: 16) {
            DemoBackdrop().frame(height: 170).overlay {
                Label("Accessible control", systemImage: "checkmark.circle.fill")
                    .font(.headline).foregroundStyle(.white)
                    .padding(18).glassEffect(.regular)
            }
            DemoPanel(title: "Current environment") {
                environmentRow("Reduce transparency", value: reduceTransparency)
                environmentRow("Reduce motion", value: reduceMotion)
                environmentRow("Differentiate without color", value: differentiateWithoutColor)
                Text("Change these in Settings → Accessibility to see the system adapt.")
                    .font(.caption).foregroundStyle(.secondary)
            }
        }
    }

    private func environmentRow(_ title: String, value: Bool) -> some View {
        HStack {
            Text(title)
            Spacer()
            Text(value ? "On" : "Off").foregroundStyle(value ? .orange : .secondary)
        }
        .font(.subheadline)
        .accessibilityElement(children: .combine)
    }
}
