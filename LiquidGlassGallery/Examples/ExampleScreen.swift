import SwiftUI

struct ExampleScreen: View {
  let example: ExampleID

  @ViewBuilder
  var body: some View {
    switch example {
    case .expandablePlayer: ExpandablePlayerExample()
    case .scrollEdgeDock: ScrollEdgeDockExample()
    case .variants: VariantsExample()
    case .shapes: ShapesExample()
    case .tintedInteractive: TintedInteractiveExample()
    case .textAndIcons: TextAndIconsExample()
    case .accessibility: AccessibilityExample()
    case .containers: ContainersExample()
    case .morphing: MorphingExample()
    case .unions: UnionsExample()
    case .transitions: TransitionsExample()
    case .buttonStyles: ButtonStylesExample()
    case .toolbars: SystemDemoLauncher(title: example.title) { ToolbarExample() }
    case .tabs: SystemDemoLauncher(title: example.title) { TabsExample() }
    case .search: SystemDemoLauncher(title: example.title) { SearchExample() }
    case .presentations: PresentationsExample()
    case .splitView: SystemDemoLauncher(title: example.title) { SplitViewExample() }
    case .backgroundExtension:
      SystemDemoLauncher(title: example.title) { BackgroundExtensionExample() }
    case .contrast: ContrastExample()
    case .appComposition: SystemDemoLauncher(title: example.title) { AppCompositionExample() }
    case .floatingActions: FloatingActionsExample()
    case .symbolReplacement: SymbolReplacementExample()
    case .dynamicAdaptation: DynamicAdaptationExample()
    case .customNavigation: CustomNavigationExample()
    case .gestureIntegration: GestureIntegrationExample()
    case .performancePatterns: RenderingCompositionExample()
    case .uikitIntegration: UIKitIntegrationExample()
    case .coreTextGlass: CoreTextGlassExample()
    case .morphingSheet: SystemDemoLauncher(title: example.title) { MorphingSheetExample() }
    case .glassSettingsSheet: GlassSettingsSheetExample()
    case .parallaxClusters: ParallaxClustersExample()
    case .glassBadges: GlassBadgesExample()
    case .photoStudio: PhotoStudioExample()
    }
  }
}
