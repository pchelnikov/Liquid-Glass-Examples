import SwiftUI

struct PhotoStudioExample: View {

    @State private var exposure = 0.25
    @State private var cropped = false
    @State private var enhanced = false
    @State private var showExposure = true

    var body: some View {
        VStack(spacing: 18) {
            photoCanvas
                .scaleEffect(cropped ? 1.25 : 1)
                .saturation(enhanced ? 1.65 : 1)
                .frame(height: 450)
                .overlay {
                    GlassEffectContainer(spacing: 8) {
                        VStack {
                            toolPalette
                            Spacer(minLength: 150)
                            if showExposure { exposureControl }
                        }
                        .padding(14)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 30))
            Text("A focused editing layer floats above the image, leaving the artwork unobstructed.")
                .font(.caption).foregroundStyle(.secondary)
        }
    }

    private var photoCanvas: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                LinearGradient(
                    colors: [.cyan, .blue.opacity(0.82), .indigo, .black], startPoint: .top, endPoint: .bottom
                )
                Circle().fill(.orange.opacity(0.9)).frame(width: 84, height: 84)
                    .blur(radius: 1).position(x: geometry.size.width * 0.72, y: geometry.size.height * 0.28)
                MountainRange().fill(.purple.opacity(0.72))
                    .frame(height: geometry.size.height * 0.52).frame(
                        maxHeight: .infinity, alignment: .bottom)
                MountainRange().fill(.black.opacity(0.42))
                    .frame(height: geometry.size.height * 0.34).scaleEffect(x: -1, y: 1)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                VStack(alignment: .leading, spacing: 4) {
                    Text("ALPINE LIGHT").font(.caption.bold()).tracking(1.5)
                    Text("06:42 · Lofoten").font(.caption).foregroundStyle(.white.opacity(0.8))
                }
                .foregroundStyle(.white).padding(20)
                .padding(.bottom, 104)
            }
            .brightness(exposure * 0.25)
            .overlay(
                LinearGradient(
                    colors: [.black.opacity(0.12), .clear, .black.opacity(0.24)], startPoint: .top,
                    endPoint: .bottom))
        }
    }

    private var toolPalette: some View {
        HStack(spacing: 16) {
            PhotoToolButton(title: "Crop preview", symbol: "crop.rotate", selected: cropped) {
                cropped.toggle()
            }
            PhotoToolButton(title: "Exposure", symbol: "slider.horizontal.3", selected: showExposure) {
                showExposure.toggle()
            }
            PhotoToolButton(title: "Enhance colors", symbol: "wand.and.stars", selected: enhanced) {
                enhanced.toggle()
            }
            ShareLink(item: "Alpine Light · Lofoten") {
                Label("Share scene description", systemImage: "square.and.arrow.up")
                    .labelStyle(.iconOnly).font(.headline).frame(width: 46, height: 46)
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: .circle)
        }
        .foregroundStyle(.white)
    }

    private var exposureControl: some View {
        HStack(spacing: 12) {
            Image(systemName: "sun.max.fill").foregroundStyle(.yellow)
            Slider(value: $exposure, in: -1...1)
                .tint(.white)
                .accessibilityLabel("Exposure")
            Text(exposure.formatted(.number.precision(.significantDigits(2))))
                .font(.caption.monospacedDigit().weight(.semibold))
                .frame(width: 38, alignment: .trailing)
        }
        .padding(.horizontal, 16).padding(.vertical, 12)
        .foregroundStyle(.white)
        .glassEffect(.regular, in: .capsule)
    }
}

private struct MountainRange: Shape {

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.height * 0.52))
            path.addLine(to: CGPoint(x: rect.width * 0.22, y: rect.height * 0.12))
            path.addLine(to: CGPoint(x: rect.width * 0.48, y: rect.height * 0.63))
            path.addLine(to: CGPoint(x: rect.width * 0.68, y: rect.height * 0.28))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.height * 0.6))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

private struct PhotoToolButton: View {

    let title: String
    let symbol: String
    let selected: Bool
    let action: () -> Void

    var body: some View {
        Button(title, systemImage: symbol, action: action)
            .labelStyle(.iconOnly)
            .font(.headline)
            .frame(width: 46, height: 46)
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: .circle)
            .overlay(alignment: .bottom) {
                if selected { Circle().fill(.white).frame(width: 4, height: 4).padding(.bottom, 5) }
            }
            .accessibilityAddTraits(selected ? .isSelected : [])
    }
}
