import SwiftUI

struct SplitViewExample: View {
  @Environment(\.horizontalSizeClass) private var horizontalSizeClass

  var body: some View {
    Group {
      if horizontalSizeClass == .compact {
        CompactSplitViewPreview()
      } else {
        RegularSplitViewPreview()
      }
    }
  }
}

private struct CompactSplitViewPreview: View {
  private let places = ["Mount Fuji", "Yosemite", "Lofoten"]
  @State private var path: [CompactSplitRoute] = []

  var body: some View {
    NavigationStack(path: $path) {
      List(places, id: \.self) { place in
        NavigationLink(value: CompactSplitRoute.place(place)) {
          Label(place, systemImage: "mountain.2.fill")
        }
      }
      .navigationTitle("Places")
      .navigationDestination(for: CompactSplitRoute.self) { route in
        switch route {
        case .place(let place):
          List(SplitViewSection.allCases) { section in
            NavigationLink(value: CompactSplitRoute.section(place: place, section: section)) {
              Label(section.rawValue, systemImage: section.symbol)
            }
          }
          .navigationTitle(place)
        case .section(let place, let section):
          PlaceDetailView(place: place, section: section.rawValue)
            .navigationTitle(section.rawValue)
        }
      }
    }
  }
}

private struct RegularSplitViewPreview: View {
  private let places = ["Mount Fuji", "Yosemite", "Lofoten"]
  @State private var visibility: NavigationSplitViewVisibility = .all
  @State private var selectedPlace: String? = "Mount Fuji"
  @State private var selectedSection: SplitViewSection? = .overview

  var body: some View {
    NavigationSplitView(columnVisibility: $visibility) {
      List(selection: $selectedPlace) {
        ForEach(places, id: \.self) { place in
          NavigationLink(value: place) {
            Label(place, systemImage: "mountain.2.fill")
          }
        }
      }
      .navigationTitle("Places")
      .navigationSplitViewColumnWidth(min: 160, ideal: 200, max: 240)
    } content: {
      List(selection: $selectedSection) {
        ForEach(SplitViewSection.allCases) { section in
          NavigationLink(value: section) {
            Label(section.rawValue, systemImage: section.symbol)
          }
        }
      }
      .navigationTitle(selectedPlace ?? "Places")
      .navigationSplitViewColumnWidth(min: 160, ideal: 200, max: 240)
    } detail: {
      PlaceDetailView(
        place: selectedPlace ?? "Choose a place",
        section: selectedSection?.rawValue ?? "Overview"
      )
      .navigationTitle("Details")
    }
    .navigationSplitViewStyle(.balanced)
  }
}

private struct PlaceDetailView: View {
  let place: String
  let section: String

  var body: some View {
    ScrollView {
      VStack(spacing: 18) {
        Image(systemName: "mountain.2.fill")
          .font(.system(size: 68))
          .foregroundStyle(.blue.gradient)
          .accessibilityHidden(true)
        Text(place).font(.title.bold())
        Text(section).font(.title3.weight(.medium))
        Text("This detail appears in the final iPad column and as a pushed screen on iPhone.")
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.center)
      }
      .padding(24)
      .frame(maxWidth: .infinity)
    }
  }
}

private enum CompactSplitRoute: Hashable {
  case place(String)
  case section(place: String, section: SplitViewSection)
}

private enum SplitViewSection: String, CaseIterable, Identifiable {
  case overview = "Overview"
  case photos = "Photos"
  case map = "Map"

  var id: String { rawValue }

  var symbol: String {
    switch self {
    case .overview: "info.circle"
    case .photos: "photo"
    case .map: "map"
    }
  }
}
