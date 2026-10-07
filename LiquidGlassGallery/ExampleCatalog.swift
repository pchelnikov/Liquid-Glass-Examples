import SwiftUI

enum ExampleGroup: String, CaseIterable, Identifiable {
  case foundations = "Foundations"
  case composition = "Composition & Motion"
  case systemUI = "System UI"

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
  case scrollEdgeDock
  case buttonStyles
  case toolbars
  case tabs
  case search
  case presentations
  case splitView
  case appComposition
  case customNavigation
  case uikitIntegration
  case morphingSheet
  case glassSettingsSheet
  case photoStudio

  var id: String { rawValue }

  var title: String {
    switch self {
    case .expandablePlayer: "Expandable glass player"
    case .scrollEdgeDock: "Scroll edge dock"
    case .variants: "Glass variants"
    case .shapes: "Shapes"
    case .tintedInteractive: "Tint & interaction"
    case .textAndIcons: "Text & icons"
    case .accessibility: "Accessibility settings"
    case .containers: "GlassEffectContainer"
    case .morphing: "Morphing identities"
    case .unions: "Glass unions"
    case .transitions: "Glass transitions"
    case .buttonStyles: "Glass button styles"
    case .toolbars: "Toolbar & navigation"
    case .tabs: "Tab bars & accessories"
    case .search: "Search"
    case .presentations: "Sheets, menus & alerts"
    case .splitView: "iPad split view"
    case .appComposition: "Complete app composition"
    case .floatingActions: "Floating action cluster"
    case .symbolReplacement: "Symbol replacement"
    case .customNavigation: "Custom glass navigation"
    case .gestureIntegration: "Gesture integration"
    case .uikitIntegration: "UIKit integration"
    case .coreTextGlass: "CoreText glass lettering"
    case .morphingSheet: "Morphing sheet presentation"
    case .glassSettingsSheet: "Glass settings sheet"
    case .parallaxClusters: "Offset glass clusters"
    case .glassBadges: "Custom glass badges"
    case .photoStudio: "Photo studio"
    }
  }

  var group: ExampleGroup {
    switch self {
    case .variants, .shapes, .tintedInteractive, .textAndIcons, .accessibility, .coreTextGlass:
      .foundations
    case .expandablePlayer, .containers, .morphing, .unions, .transitions, .floatingActions, .symbolReplacement, .gestureIntegration, .parallaxClusters, .glassBadges:
      .composition
    case .scrollEdgeDock, .buttonStyles, .toolbars, .tabs, .search, .presentations, .splitView, .appComposition, .customNavigation, .uikitIntegration, .morphingSheet, .glassSettingsSheet, .photoStudio:
      .systemUI
    }
  }

  var symbol: String {
    switch self {
    case .expandablePlayer: "play.rectangle"
    case .scrollEdgeDock: "rectangle.bottomthird.inset.filled"
    case .variants: "circle.lefthalf.filled"
    case .shapes: "square.on.circle"
    case .tintedInteractive: "hand.tap"
    case .textAndIcons: "textformat"
    case .accessibility: "figure.wave"
    case .containers: "square.stack.3d.up"
    case .morphing: "arrow.trianglehead.2.clockwise.rotate.90"
    case .unions: "point.3.connected.trianglepath.dotted"
    case .transitions: "sparkles"
    case .buttonStyles: "button.horizontal"
    case .toolbars: "rectangle.topthird.inset.filled"
    case .tabs: "rectangle.bottomthird.inset.filled"
    case .search: "magnifyingglass"
    case .presentations: "rectangle.center.inset.filled"
    case .splitView: "rectangle.split.2x1"
    case .appComposition: "square.grid.2x2"
    case .floatingActions: "plus.circle"
    case .symbolReplacement: "heart"
    case .customNavigation: "arrow.left.arrow.right"
    case .gestureIntegration: "hand.draw"
    case .uikitIntegration: "swift"
    case .coreTextGlass: "textformat.abc"
    case .morphingSheet: "rectangle.bottomhalf.inset.filled"
    case .glassSettingsSheet: "slider.horizontal.3"
    case .parallaxClusters: "circle.grid.3x3.fill"
    case .glassBadges: "rosette"
    case .photoStudio: "camera.macro"
    }
  }

  var description: String {
    switch self {
    case .expandablePlayer:
      "Morph a compact control into a player panel with one stable glass identity."
    case .scrollEdgeDock: "Keep a floating dock readable while content scrolls beneath it."
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
    case .buttonStyles: "Use the standard and prominent system glass button styles."
    case .toolbars: "System navigation and toolbar controls receive glass automatically."
    case .tabs: "Explore system tab glass, minimized behavior, and a bottom accessory."
    case .search: "See search integrated with a navigation stack and system toolbar."
    case .presentations: "Present native sheets, menus, alerts, and confirmation dialogs."
    case .splitView: "Compare the three-column iPad layout with a compact navigation flow."
    case .appComposition:
      "Combine navigation, tabs, badges, search, and an accessory in one small app."
    case .floatingActions: "Build a compact floating action cluster from related glass controls."
    case .symbolReplacement: "Animate a changing symbol with the system replacement transition."
    case .customNavigation: "Use glass as a floating navigation and action layer over content."
    case .gestureIntegration:
      "Move a glass control with a gesture while keeping interaction attached to the control."
    case .uikitIntegration: "Use UIKit glass effect views alongside SwiftUI examples."
    case .coreTextGlass: "Turn CoreText glyph outlines into custom glass lettering."
    case .morphingSheet: "Morph a toolbar control into a native partial-height sheet."
    case .glassSettingsSheet:
      "Keep a settings form and pushed destinations translucent as sheet detents change."
    case .parallaxClusters:
      "Move offset glass controls through a shared container to explore shape blending."
    case .glassBadges: "Build colorful custom badges and animate them in a shared glass container."
    case .photoStudio:
      "Explore a photo editing toolbar and exposure control floating above artwork."
    }
  }
}

extension ExampleGroup {
  var examples: [ExampleID] { ExampleID.allCases.filter { $0.group == self } }
}
