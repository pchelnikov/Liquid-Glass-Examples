import SwiftUI

struct ButtonStylesExample: View {

    @State private var count = 0

    var body: some View {
        VStack(spacing: 18) {
            DemoBackdrop().frame(height: 280).overlay {
                VStack(spacing: 16) {
                    Button("Glass button") { count += 1 }.buttonStyle(.glass)
                    Button("Prominent action") { count += 1 }.buttonStyle(.glassProminent).tint(.orange)
                    Button("Add one", systemImage: "plus") { count += 1 }
                        .labelStyle(.iconOnly).buttonStyle(.glass).buttonBorderShape(.circle)
                }
            }
            Text("Button taps: \(count)").font(.headline).monospacedDigit()
        }
    }
}
