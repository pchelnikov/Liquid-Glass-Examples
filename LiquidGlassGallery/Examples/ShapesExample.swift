import SwiftUI

struct ShapesExample: View {

    private let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    var body: some View {
        VStack(spacing: 18) {
            DemoPanel(title: "Glass shapes") {
                Text("Compare the outlines. Labels sit below the glass so every shape stays clear.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            GlassEffectContainer(spacing: 14) {
                VStack {
                    LazyVGrid(columns: columns, spacing: 18) {
                        shapeItem(
                            "Capsule", symbol: "waveform", width: 108, height: 68, shape: AnyShape(Capsule()))
                        shapeItem(
                            "Circle", symbol: "heart.fill", width: 68, height: 68, shape: AnyShape(Circle()))
                        shapeItem("Ellipse", symbol: "oval", width: 108, height: 68, shape: AnyShape(Ellipse()))
                        shapeItem(
                            "Rounded rectangle", symbol: "slider.horizontal.3", width: 108, height: 68,
                            shape: AnyShape(RoundedRectangle(cornerRadius: 18, style: .continuous)))
                        shapeItem(
                            "Custom diamond", symbol: "diamond.fill", width: 68, height: 68,
                            shape: AnyShape(DiamondShape()))
                        concentricShapeItem
                    }
                    .padding(20)
                }
            }
            .background { DemoBackdrop(showsCaption: false) }
        }
    }

    private func shapeItem(
        _ title: String, symbol: String, width: CGFloat, height: CGFloat, shape: AnyShape
    ) -> some View {
        VStack(spacing: 9) {
            Image(systemName: symbol)
                .font(.title3.weight(.semibold))
                .foregroundStyle(.white)
                .frame(width: width, height: height)
                .glassEffect(.regular, in: shape)

            Text(title)
                .font(.footnote.weight(.medium))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: .infinity, minHeight: 34)
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .combine)
    }

    private var concentricShapeItem: some View {
        VStack(spacing: 9) {
            ZStack {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white.opacity(0.11))
                Image(systemName: "rectangle.inset.filled")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)
                    .frame(width: 92, height: 52)
                    .glassEffect(.regular, in: ConcentricRectangle(corners: .concentric(minimum: .fixed(16))))
            }
            .frame(width: 108, height: 68)
            .containerShape(.rect(cornerRadius: 24))

            Text("Container-concentric")
                .font(.footnote.weight(.medium))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: .infinity, minHeight: 34)
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .combine)
    }
}

private struct DiamondShape: Shape {

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.closeSubpath()
        }
    }
}
