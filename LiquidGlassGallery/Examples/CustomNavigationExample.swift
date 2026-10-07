import SwiftUI

struct CustomNavigationExample: View {
  @Environment(\.accessibilityReduceMotion) private var reduceMotion
  private let titles = ["Photos", "Map", "Notes"]
  private let symbols = ["photo", "map", "note.text"]
  @State private var selected = 0

  var body: some View {
    DemoBackdrop().frame(height: 310).overlay {
      VStack(spacing: 24) {
        VStack(spacing: 8) {
          Image(systemName: symbols[selected]).font(.system(size: 52)).contentTransition(
            .symbolEffect(.replace))
          Text(titles[selected]).font(.title2.bold())
        }
        GlassEffectContainer(spacing: 8) {
          HStack(spacing: 16) {
            ForEach(titles.indices, id: \.self) { index in
              Button {
                withAnimation(reduceMotion ? nil : .snappy) { selected = index }
              } label: {
                Label(titles[index], systemImage: symbols[index]).labelStyle(.iconOnly)
                  .frame(width: 48, height: 48)
              }
              .buttonStyle(.plain)
              .glassEffect(.regular.interactive(), in: .circle)
              .overlay(alignment: .bottom) {
                if selected == index {
                  Circle().fill(.white).frame(width: 4, height: 4).padding(.bottom, 5)
                }
              }
              .accessibilityAddTraits(selected == index ? .isSelected : [])
            }
          }
        }
      }.foregroundStyle(.white)
    }
  }
}
