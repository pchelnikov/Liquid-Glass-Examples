import SwiftUI
import UIKit

struct UIKitIntegrationExample: View {

    var body: some View {
        VStack(spacing: 18) {
            DemoPanel(title: "UIKit glass effects") {
                Text(
                    "Native UIGlassEffect surfaces hosted in SwiftUI, with real SF Symbols and Dynamic Type labels."
                )
                .foregroundStyle(.secondary)
            }
            DemoBackdrop()
                .frame(height: 210)
                .overlay { UIKitGlassControls().padding(24) }
        }
    }
}

private struct UIKitGlassControls: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        let effect = UIGlassContainerEffect()
        effect.spacing = 8
        let container = UIVisualEffectView(effect: effect)
        let stack = UIStackView(arrangedSubviews: [
            makeSurface("Regular", symbol: "sparkle", style: .regular),
            makeSurface("Clear", symbol: "circle.lefthalf.filled", style: .clear),
        ])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        container.contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: container.contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: container.contentView.trailingAnchor),
            stack.centerYAnchor.constraint(equalTo: container.contentView.centerYAnchor),
            stack.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        ])
        return container
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}

    private func makeSurface(_ title: String, symbol: String, style: UIGlassEffect.Style) -> UIView {
        let surface = UIVisualEffectView(effect: UIGlassEffect(style: style))
        surface.layer.cornerRadius = 24
        surface.clipsToBounds = true
        let icon = UIImageView(image: UIImage(systemName: symbol))
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .white
        icon.preferredSymbolConfiguration = .init(textStyle: .title2)
        let label = UILabel()
        label.text = title
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
        let content = UIStackView(arrangedSubviews: [icon, label])
        content.axis = .vertical
        content.spacing = 8
        content.alignment = .center
        content.translatesAutoresizingMaskIntoConstraints = false
        surface.contentView.addSubview(content)
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: surface.contentView.leadingAnchor, constant: 12),
            content.trailingAnchor.constraint(equalTo: surface.contentView.trailingAnchor, constant: -12),
            content.topAnchor.constraint(equalTo: surface.contentView.topAnchor, constant: 16),
            content.bottomAnchor.constraint(equalTo: surface.contentView.bottomAnchor, constant: -16),
        ])
        surface.isAccessibilityElement = true
        surface.accessibilityLabel = "\(title) glass"
        return surface
    }
}
