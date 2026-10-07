import SwiftUI

struct CustomNavigationExample: View {

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var selected: Destination = .photos

    var body: some View {
        DemoBackdrop().frame(height: 310).overlay {
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Image(systemName: selected.symbol).font(.system(size: 52)).contentTransition(
                        .symbolEffect(.replace))
                    Text(selected.rawValue).font(.title2.bold())
                }
                GlassEffectContainer(spacing: 8) {
                    HStack(spacing: 16) {
                        ForEach(Destination.allCases) { destination in
                            Button {
                                withAnimation(reduceMotion ? nil : .snappy) { selected = destination }
                            } label: {
                                Label(destination.rawValue, systemImage: destination.symbol).labelStyle(.iconOnly)
                                    .frame(width: 48, height: 48)
                            }
                            .buttonStyle(.plain)
                            .glassEffect(.regular.interactive(), in: .circle)
                            .overlay(alignment: .bottom) {
                                if selected == destination {
                                    Circle().fill(.white).frame(width: 4, height: 4).padding(.bottom, 5)
                                }
                            }
                            .accessibilityAddTraits(selected == destination ? .isSelected : [])
                        }
                    }
                }
            }.foregroundStyle(.white)
        }
    }

    private enum Destination: String, CaseIterable, Identifiable {
        case photos = "Photos"
        case map = "Map"
        case notes = "Notes"

        var id: Self { self }

        var symbol: String {
            switch self {
            case .photos: "photo"
            case .map: "map"
            case .notes: "note.text"
            }
        }
    }
}
