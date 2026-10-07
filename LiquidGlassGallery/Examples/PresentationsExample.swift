import SwiftUI

struct PresentationsExample: View {
  @State private var showSheet = false
  @State private var showPopover = false
  @State private var showConfirmation = false
  @State private var showAlert = false
  @State private var favorite = false
  @State private var result = "Choose a presentation to explore."

  var body: some View {
    VStack(spacing: 16) {
      Button("Present a sheet") { showSheet = true }
        .sheet(isPresented: $showSheet) { NativeSheetPreview() }
      Menu {
        Button(
          favorite ? "Remove favorite" : "Favorite", systemImage: favorite ? "star.fill" : "star"
        ) {
          favorite.toggle()
          result = favorite ? "Added to favorites." : "Removed from favorites."
        }
        ShareLink(item: "Liquid Glass Gallery")
        Button("Delete", systemImage: "trash", role: .destructive) { showConfirmation = true }
      } label: {
        Label("Show a menu", systemImage: "ellipsis.circle")
      }
      Button("Show an alert") { showAlert = true }
        .alert("A native alert", isPresented: $showAlert) {
          Button("Done", role: .cancel) { result = "Alert dismissed." }
        } message: {
          Text("Alerts use the system presentation appearance.")
        }
      Button("Confirmation dialog") { showConfirmation = true }
        .confirmationDialog(
          "Delete the demo item?", isPresented: $showConfirmation, titleVisibility: .visible
        ) {
          Button("Delete demo item", role: .destructive) {
            result = "Demo item deleted. No files were changed."
          }
          Button("Cancel", role: .cancel) {}
        }
      Button("Show a popover") { showPopover = true }
        .popover(isPresented: $showPopover) {
          Label("A contextual popover", systemImage: "info.circle")
            .padding(28).presentationCompactAdaptation(.popover)
        }
      Text(result).font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center)
      Text("This popover explicitly stays a popover on iPhone.")
        .font(.caption).foregroundStyle(.secondary)
    }
    .buttonStyle(.glass)
  }
}

private struct NativeSheetPreview: View {
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      VStack(spacing: 18) {
        Image(systemName: "sparkles.rectangle.stack").font(.system(size: 44)).foregroundStyle(
          .orange)
        Text("Native sheet presentation").font(.title2.bold())
        Text("Drag between medium and large detents to compare the system presentation surfaces.")
          .multilineTextAlignment(.center).foregroundStyle(.secondary)
      }
      .padding(32)
      .navigationTitle("Sheet")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .confirmationAction) { Button("Done") { dismiss() } }
      }
    }
    .presentationDetents([.medium, .large])
  }
}
