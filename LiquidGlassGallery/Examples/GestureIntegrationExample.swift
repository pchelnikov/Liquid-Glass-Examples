import SwiftUI

struct GestureIntegrationExample: View {
  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  @State private var offset = CGSize.zero
  @GestureState private var dragging = false

  var body: some View {
    DemoBackdrop().frame(height: 340).overlay {
      GeometryReader { geometry in
        VStack(spacing: 24) {
          Text("Drag the glass control")
            .font(.caption.weight(.medium))
            .multilineTextAlignment(.center)
          Spacer()
          Image(systemName: "hand.draw.fill")
            .font(.title)
            .frame(width: 70, height: 70)
            .glassEffect(.regular.interactive(), in: .circle)
            .scaleEffect(dragging && !reduceMotion ? 1.08 : 1)
            .offset(offset)
            .gesture(
              DragGesture()
                .updating($dragging) { _, state, _ in state = true }
                .onChanged { value in
                  let limit = max(0, geometry.size.width / 2 - 50)
                  offset = CGSize(
                    width: min(max(value.translation.width, -limit), limit),
                    height: min(max(value.translation.height, -60), 60))
                }
                .onEnded { _ in
                  withAnimation(reduceMotion ? nil : .spring) { offset = .zero }
                }
            )
            .accessibilityLabel("Draggable glass control")
            .accessibilityHint("Drag to move. Release to return to the center.")
          Spacer()
        }
        .foregroundStyle(.white)
        .padding(.top, 24)
        .padding(.bottom, 60)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
    }
  }
}
