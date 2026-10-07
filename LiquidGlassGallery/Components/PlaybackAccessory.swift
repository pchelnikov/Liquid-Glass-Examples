import SwiftUI

/// A local playback simulation; no audio is downloaded or played.
struct PlaybackAccessory: View {

    @Environment(\.tabViewBottomAccessoryPlacement) private var placement
    @State private var isPlaying = true

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "waveform.circle.fill")
                .font(.title2)
                .foregroundStyle(.orange)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 2) {
                Text("A little more light").font(.caption.weight(.semibold))
                if placement != .inline {
                    Text("Playback demo").font(.caption2).foregroundStyle(.secondary)
                }
            }
            Spacer(minLength: 8)
            Button(isPlaying ? "Pause" : "Play", systemImage: isPlaying ? "pause.fill" : "play.fill") {
                isPlaying.toggle()
            }
            .labelStyle(.iconOnly)
            .frame(minWidth: 44, minHeight: 44)
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 12)
    }
}
