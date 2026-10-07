import SwiftUI

struct ContentView: View {

    @State private var selection: ExampleID? = GalleryLaunchConfiguration.example
    @State private var query = ""

    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                ForEach(ExampleGroup.allCases) { group in
                    Section(group.rawValue) {
                        ForEach(
                            group.examples.filter {
                                query.isEmpty || $0.title.localizedCaseInsensitiveContains(query)
                            }
                        ) { example in
                            NavigationLink(value: example) {
                                Label(example.title, systemImage: example.symbol)
                            }
                        }
                    }
                }
            }
            .searchable(text: $query, prompt: "Find an example")
            .navigationTitle("Liquid Glass")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            if let selection {
                ExampleDetailView(example: selection)
                    .id(selection)
            } else {
                ContentUnavailableView("Choose an example", systemImage: "hand.point.left")
            }
        }
        .navigationSplitViewStyle(.balanced)
        .tint(.orange)
    }
}

#Preview {
    ContentView()
}
