import SwiftUI

struct GlassBadgesExample: View {

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var showAll = false
    @Namespace private var namespace

    var body: some View {
        VStack(spacing: 22) {
            GlassEffectContainer(spacing: 8) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 128), spacing: 16)], spacing: 16) {
                    ForEach(Badge.allCases.prefix(showAll ? 4 : 2)) { badge in
                        GlassBadge(badge: badge)
                            .glassEffectID(badge, in: namespace)
                    }
                }
                .padding(24)
            }
            .background { DemoBackdrop(showsCaption: false) }
            Button(showAll ? "Show fewer badges" : "Reveal all badges") {
                withAnimation(reduceMotion ? nil : .spring(response: 0.45, dampingFraction: 0.78)) {
                    showAll.toggle()
                }
            }
            .buttonStyle(.glassProminent)
            Text(
                "The badge grid adapts to the available width. Each badge keeps a stable glass identity as the collection expands."
            )
            .font(.caption).foregroundStyle(.secondary)
        }
    }
}

private enum Badge: String, CaseIterable, Identifiable {
    case peakFinder = "Peak finder"
    case earlyRiser = "Early riser"
    case trailKeeper = "Trail keeper"
    case nightHiker = "Night hiker"
    var id: Self { self }
    var symbol: String {
        switch self {
        case .peakFinder: "mountain.2.fill"
        case .earlyRiser: "sunrise.fill"
        case .trailKeeper: "leaf.fill"
        case .nightHiker: "moon.stars.fill"
        }
    }
    var color: Color {
        switch self {
        case .peakFinder: .blue
        case .earlyRiser: .orange
        case .trailKeeper: .green
        case .nightHiker: .indigo
        }
    }
}

private struct GlassBadge: View {

    let badge: Badge

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                Image(systemName: "hexagon.fill").font(.system(size: 64)).foregroundStyle(
                    badge.color.gradient)
                Image(systemName: badge.symbol).font(.system(size: 26, weight: .semibold))
            }
            Text(badge.rawValue).font(.caption.weight(.semibold)).multilineTextAlignment(.center)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .padding(12)
        .glassEffect(.regular, in: .rect(cornerRadius: 22))
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(badge.rawValue)
    }
}
