import SwiftUI

struct TransitionsExample: View {

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Namespace private var namespace
    @State private var shown = false
    @State private var materialize = false

    var body: some View {
        VStack(spacing: 20) {
            DemoBackdrop().frame(height: 250).overlay {
                GlassEffectContainer(spacing: 20) {
                    VStack(spacing: 16) {
                        Text("Always here").padding(14).glassEffect()
                            .glassEffectID("anchor", in: namespace)
                        if shown {
                            Label("New glass view", systemImage: "sparkles")
                                .padding(14).glassEffect()
                                .glassEffectID("inserted", in: namespace)
                                .glassEffectTransition(materialize ? .materialize : .matchedGeometry)
                        }
                    }
                    .foregroundStyle(.white)
                }
            }
            Toggle("Materialize transition", isOn: $materialize).padding(.horizontal)
            Button(shown ? "Remove view" : "Add view") {
                withAnimation(reduceMotion ? nil : .spring(response: 0.5, dampingFraction: 0.8)) {
                    shown.toggle()
                }
            }.buttonStyle(.glass)
        }
    }
}
