import SwiftUI

struct GlassSettingsSheetExample: View {
  @State private var isPresented = false

  var body: some View {
    VStack(spacing: 20) {
      DemoPanel(title: "Settings that keep their glass") {
        Text(
          "The sheet hides the Form background at its medium detent. Pushed settings destinations clear their navigation background so the presentation material can show through."
        )
        .foregroundStyle(.secondary)
      }
      Button("Open notification settings", systemImage: "slider.horizontal.3") {
        isPresented = true
      }
      .buttonStyle(.glassProminent)
    }
    .sheet(isPresented: $isPresented) {
      GlassSettingsFormSheet()
    }
  }
}

private struct GlassSettingsFormSheet: View {
  @Environment(\.dismiss) private var dismiss
  private let alertLevels = ["Off", "Severe only", "Daily forecast", "All updates"]
  @State private var detent: PresentationDetent = .medium
  @State private var digestEnabled = true
  @State private var alertLevel = "Severe only"

  var body: some View {
    NavigationStack {
      Form {
        Section("Notifications") {
          Toggle("Daily digest", isOn: $digestEnabled)
          NavigationLink("Weather alerts") {
            Form {
              Picker("Alert level", selection: $alertLevel) {
                ForEach(alertLevels, id: \.self) {
                  Text($0).containerBackground(.clear, for: .navigation)
                }
              }
              .pickerStyle(.navigationLink)
            }
            .scrollContentBackground(detent == .medium ? .hidden : .automatic)
            .containerBackground(.clear, for: .navigation)
            .navigationTitle("Weather alerts")
          }
        }
        Section("Appearance") {
          Label("System appearance", systemImage: "circle.lefthalf.filled")
          Text("The detent controls when the Form's own background is visible.")
            .font(.caption).foregroundStyle(.secondary)
        }
      }
      .scrollContentBackground(detent == .medium ? .hidden : .automatic)
      .navigationTitle("Notifications")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .confirmationAction) {
          Button("Done") { dismiss() }
        }
      }
    }
    .presentationDetents([.medium, .large], selection: $detent)
  }
}
