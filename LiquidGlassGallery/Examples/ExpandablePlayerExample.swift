import SwiftUI

struct ExpandablePlayerExample: View {

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var expanded = false
    @State private var playing = false
    @State private var progress = 0.35
    @Namespace private var namespace

    var body: some View {
        VStack(spacing: 20) {
            GlassEffectContainer(spacing: 24) {
                VStack(spacing: 24) {
                    Image(systemName: "waveform")
                        .font(.system(size: 64, weight: .light))
                        .accessibilityHidden(true)
                    Text("Northern lights").font(.title2.bold())
                    if expanded {
                        ExpandedPlayerControls(playing: $playing, progress: $progress, collapse: toggleExpanded)
                            .frame(maxWidth: 380)
                            .foregroundStyle(Color.primary)
                            .glassEffect(.regular, in: .rect(cornerRadius: 28))
                            .glassEffectID("player", in: namespace)
                    } else {
                        Button("Open player", systemImage: "play.fill", action: toggleExpanded)
                            .labelStyle(.iconOnly)
                            .frame(width: 64, height: 64)
                            .buttonStyle(.plain)
                            .glassEffect(.regular.interactive(), in: .circle)
                            .glassEffectID("player", in: namespace)
                    }
                }
                .foregroundStyle(.white)
                .padding(24)
                .frame(maxWidth: .infinity, minHeight: 370)
            }
            .background { DemoBackdrop(showsCaption: false) }
            Text(
                "Open the player to morph one glass identity from a circle into a panel. Playback and scrubbing are local UI demonstrations."
            )
            .font(.caption).foregroundStyle(.secondary)
        }
    }

    private func toggleExpanded() {
        withAnimation(reduceMotion ? nil : .spring(response: 0.5, dampingFraction: 0.82)) {
            expanded.toggle()
        }
    }
}

private struct ExpandedPlayerControls: View {

    @Binding var playing: Bool
    @Binding var progress: Double
    let collapse: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(playing ? "Playing demo" : "Paused").font(.subheadline.weight(.medium))
                Spacer()
                Button("Collapse player", systemImage: "chevron.down", action: collapse)
                    .labelStyle(.iconOnly).frame(minWidth: 44, minHeight: 44)
            }
            Slider(value: $progress, in: 0...1)
                .tint(.primary)
                .accessibilityLabel("Playback position")
                .accessibilityValue("\(Int(progress * 100)) percent")
            HStack {
                Text("\(Int(progress * 180) / 60):\(String(format: "%02d", Int(progress * 180) % 60))")
                    .font(.caption.monospacedDigit())
                Spacer()
                Button(playing ? "Pause" : "Play", systemImage: playing ? "pause.fill" : "play.fill") {
                    playing.toggle()
                }
                .labelStyle(.iconOnly).font(.title2).frame(minWidth: 44, minHeight: 44)
                Spacer()
                Text("3:00").font(.caption.monospacedDigit())
            }
        }
        .buttonStyle(.plain)
        .padding(20)
    }
}

#Preview { ExampleDetailView(example: .expandablePlayer) }
