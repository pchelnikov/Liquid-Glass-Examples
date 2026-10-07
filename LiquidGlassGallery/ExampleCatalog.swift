import SwiftUI

enum ExampleGroup: String, CaseIterable, Identifiable {
  case foundations = "Foundations"

  var id: String { rawValue }
}

enum ExampleID: String, CaseIterable, Identifiable {
  case variants
  case shapes
  case tintedInteractive
  case textAndIcons
  case accessibility
  case coreTextGlass

  var id: String { rawValue }

  var title: String {
    switch self {
    case .variants: "Glass variants"
    case .shapes: "Shapes"
    case .tintedInteractive: "Tint & interaction"
    case .textAndIcons: "Text & icons"
    case .accessibility: "Accessibility settings"
    case .coreTextGlass: "CoreText glass lettering"
    }
  }

  var group: ExampleGroup {
    switch self {
    case .variants, .shapes, .tintedInteractive, .textAndIcons, .accessibility, .coreTextGlass:
      .foundations
    }
  }

  var symbol: String {
    switch self {
    case .variants: "circle.lefthalf.filled"
    case .shapes: "square.on.circle"
    case .tintedInteractive: "hand.tap"
    case .textAndIcons: "textformat"
    case .accessibility: "figure.wave"
    case .coreTextGlass: "textformat.abc"
    }
  }

  var description: String {
    switch self {
    case .variants: "Compare regular, clear, and identity glass against the same content."
    case .shapes: "Apply glass to capsules, circles, and custom rounded rectangles."
    case .tintedInteractive: "Explore tint and interactive responses on custom glass controls."
    case .textAndIcons: "Check vibrant labels and symbols over a glass surface."
    case .accessibility:
      "System glass adapts to accessibility preferences; compare the available settings here."
    case .coreTextGlass: "Turn CoreText glyph outlines into custom glass lettering."
    }
  }
}

extension ExampleGroup {
  var examples: [ExampleID] { ExampleID.allCases.filter { $0.group == self } }
}
