import SwiftUI

struct ExampleScreen: View {
  let example: ExampleID

  @ViewBuilder
  var body: some View {
    switch example {
    case .expandablePlayer: ExpandablePlayerExample()
    case .variants: VariantsExample()
    case .shapes: ShapesExample()
    case .tintedInteractive: TintedInteractiveExample()
    case .textAndIcons: TextAndIconsExample()
    case .accessibility: AccessibilityExample()
    case .containers: ContainersExample()
    case .morphing: MorphingExample()
    case .unions: UnionsExample()
    case .transitions: TransitionsExample()
    case .floatingActions: FloatingActionsExample()
    case .symbolReplacement: SymbolReplacementExample()
    case .gestureIntegration: GestureIntegrationExample()
    case .coreTextGlass: CoreTextGlassExample()
    case .parallaxClusters: ParallaxClustersExample()
    case .glassBadges: GlassBadgesExample()
    }
  }
}
