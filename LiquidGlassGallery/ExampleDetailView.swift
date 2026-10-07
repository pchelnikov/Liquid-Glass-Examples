import SwiftUI

struct ExampleDetailView: View {
  let example: ExampleID

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 10) {
          Label(example.group.rawValue.uppercased(), systemImage: example.symbol)
            .font(.caption.weight(.semibold))
            .foregroundStyle(.secondary)
          Text(example.title)
            .font(.largeTitle.bold())
            .accessibilityAddTraits(.isHeader)
          Text(example.description)
            .font(.body)
            .foregroundStyle(.secondary)
        }

        ExampleScreen(example: example)
          .frame(maxWidth: .infinity)
      }
      .frame(maxWidth: 760, alignment: .leading)
      .frame(maxWidth: .infinity)
      .padding(.horizontal, 22)
      .padding(.vertical, 24)
    }
    .background(Color(uiColor: .systemGroupedBackground))
    .navigationTitle(example.title)
    .navigationBarTitleDisplayMode(.inline)
  }
}
