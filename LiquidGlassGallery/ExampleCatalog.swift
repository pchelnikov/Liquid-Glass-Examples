import SwiftUI

enum ExampleGroup: String, CaseIterable, Identifiable {
  case foundations = "Foundations"
  case composition = "Composition & Motion"

  var id: String { rawValue }
}

enum ExampleID: String, CaseIterable, Identifiable {
  case variants
  case shapes
  case tintedInteractive
  case textAndIcons
  case accessibility
  case coreTextGlass
  case expandablePlayer
  case containers
  case morphing
  case unions
  case transitions
  case floatingActions
  case symbolReplacement
  case gestureIntegration
  case parallaxClusters
  case glassBadges

  var id: String { rawValue }

  var title: String {
    switch self {
    case .expandablePlayer: "Expandable glass player"
    case .variants: "Glass variants"
    case .shapes: "Shapes"
    case .tintedInteractive: "Tint & interaction"
    case .textAndIcons: "Text & icons"
    case .accessibility: "Accessibility settings"
    case .containers: "GlassEffectContainer"
    case .morphing: "Morphing identities"
    case .unions: "Glass unions"
    case .transitions: "Glass transitions"
    case .floatingActions: "Floating action cluster"
    case .symbolReplacement: "Symbol replacement"
    case .gestureIntegration: "Gesture integration"
    case .coreTextGlass: "CoreText glass lettering"
    case .parallaxClusters: "Offset glass clusters"
    case .glassBadges: "Custom glass badges"
    }
  }

  var group: ExampleGroup {
    switch self {
    case .variants, .shapes, .tintedInteractive, .textAndIcons, .accessibility, .coreTextGlass:
      .foundations
    case .expandablePlayer, .containers, .morphing, .unions, .transitions, .floatingActions, .symbolReplacement, .gestureIntegration, .parallaxClusters, .glassBadges:
      .composition
    }
  }

  var symbol: String {
    switch self {
    case .expandablePlayer: "play.rectangle"
    case .variants: "circle.lefthalf.filled"
    case .shapes: "square.on.circle"
    case .tintedInteractive: "hand.tap"
    case .textAndIcons: "textformat"
    case .accessibility: "figure.wave"
    case .containers: "square.stack.3d.up"
    case .morphing: "arrow.trianglehead.2.clockwise.rotate.90"
    case .unions: "point.3.connected.trianglepath.dotted"
    case .transitions: "sparkles"
    case .floatingActions: "plus.circle"
    case .symbolReplacement: "heart"
    case .gestureIntegration: "hand.draw"
    case .coreTextGlass: "textformat.abc"
    case .parallaxClusters: "circle.grid.3x3.fill"
    case .glassBadges: "rosette"
    }
  }

  var description: String {
    switch self {
    case .expandablePlayer:
      "Morph a compact control into a player panel with one stable glass identity."
    case .variants: "Compare regular, clear, and identity glass against the same content."
    case .shapes: "Apply glass to capsules, circles, and custom rounded rectangles."
    case .tintedInteractive: "Explore tint and interactive responses on custom glass controls."
    case .textAndIcons: "Check vibrant labels and symbols over a glass surface."
    case .accessibility:
      "System glass adapts to accessibility preferences; compare the available settings here."
    case .containers: "See nearby effects blend inside a shared rendering container."
    case .morphing:
      "Toggle a related control in and out of a container to see its glass identity morph."
    case .unions: "Join related glass elements even when a gap separates them."
    case .transitions: "Compare matched-geometry and materialize transitions."
    case .floatingActions: "Build a compact floating action cluster from related glass controls."
    case .symbolReplacement: "Animate a changing symbol with the system replacement transition."
    case .gestureIntegration:
      "Move a glass control with a gesture while keeping interaction attached to the control."
    case .coreTextGlass: "Turn CoreText glyph outlines into custom glass lettering."
    case .parallaxClusters:
      "Move offset glass controls through a shared container to explore shape blending."
    case .glassBadges: "Build colorful custom badges and animate them in a shared glass container."
    }
  }
}

extension ExampleGroup {
  var examples: [ExampleID] { ExampleID.allCases.filter { $0.group == self } }
}
