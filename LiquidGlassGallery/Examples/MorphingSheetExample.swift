import SwiftUI

struct MorphingSheetExample: View {
  @State private var isPresented = false
  @Namespace private var transitionNamespace

  var body: some View {
    NavigationStack {
      VStack(spacing: 20) {
        scenicCard
        Text(
          "Use the bottom toolbar button to open a partial sheet. Its surface zooms from the button and returns when dismissed."
        )
        .font(.subheadline).foregroundStyle(.secondary)
      }
      .padding()
      .navigationTitle("Landmark details")
      .toolbar {
        ToolbarSpacer(placement: .bottomBar)
        ToolbarItem(placement: .bottomBar) {
          Button("Info", systemImage: "info.circle") { isPresented = true }
        }
        .matchedTransitionSource(id: "landmark-info", in: transitionNamespace)
      }
      .sheet(isPresented: $isPresented) {
        VStack(spacing: 16) {
          Image(systemName: "mountain.2.fill")
            .font(.system(size: 44)).foregroundStyle(.blue.gradient)
          Text("About this place").font(.title2.bold())
          Text(
            "The sheet uses the system presentation material and expands from its toolbar source."
          )
          .multilineTextAlignment(.center).foregroundStyle(.secondary)
        }
        .padding(30)
        .presentationDetents([.medium, .large])
        .navigationTransition(.zoom(sourceID: "landmark-info", in: transitionNamespace))
      }
    }
  }

  private var scenicCard: some View {
    ZStack(alignment: .bottomLeading) {
      LinearGradient(
        colors: [.cyan.opacity(0.8), .blue, .indigo], startPoint: .top, endPoint: .bottom)
      Image(systemName: "sun.max.fill")
        .font(.system(size: 54)).foregroundStyle(.yellow)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(24)
      Image(systemName: "mountain.2.fill")
        .resizable().scaledToFit().foregroundStyle(.black.opacity(0.42))
        .frame(maxWidth: .infinity, maxHeight: 180, alignment: .bottom)
      VStack(alignment: .leading, spacing: 4) {
        Text("MOUNT FUJI").font(.caption.bold()).tracking(1.4)
        Text("A quiet morning above the clouds").font(.title3.bold())
      }
      .foregroundStyle(.white).padding(20)
    }
    .frame(height: 260)
    .clipShape(RoundedRectangle(cornerRadius: 24))
  }
}
