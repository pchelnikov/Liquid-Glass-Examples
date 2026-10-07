import SwiftUI

struct ExampleScreen: View {
  let example: ExampleID

  @ViewBuilder
  var body: some View {
    switch example {
    case .variants: VariantsExample()
    case .shapes: ShapesExample()
    case .tintedInteractive: TintedInteractiveExample()
    case .textAndIcons: TextAndIconsExample()
    case .accessibility: AccessibilityExample()
    case .coreTextGlass: CoreTextGlassExample()
    }
  }
}
