import CoreText
import SwiftUI

struct CoreTextGlassExample: View {

    var body: some View {
        VStack(spacing: 20) {
            DemoBackdrop().frame(height: 270).overlay {
                CoreTextOutline()
                    .fill(.white.opacity(0.14))
                    .glassEffect(.regular, in: CoreTextOutline())
                    .overlay {
                        CoreTextOutline().stroke(.white.opacity(0.8), lineWidth: 1)
                    }
                    .padding(14)
            }
            Text("CoreText glyph paths let the glass follow a custom typographic silhouette.")
                .foregroundStyle(.secondary)
        }
    }
}

private struct CoreTextOutline: Shape {

    // The lettering is immutable; build the glyph outlines once, then only transform them for layout.
    private static let outline: Path = {
        let font = CTFontCreateWithName("AvenirNext-DemiBold" as CFString, 92, nil)
        let text = NSAttributedString(
            string: "GLASS",
            attributes: [NSAttributedString.Key(kCTFontAttributeName as String): font])
        let line = CTLineCreateWithAttributedString(text)
        let result = CGMutablePath()
        // CoreText guarantees that CTLineGetGlyphRuns contains CTRun objects.
        for run in CTLineGetGlyphRuns(line) as! [CTRun] {
            let count = CTRunGetGlyphCount(run)
            guard count > 0 else { continue }
            var glyphs = [CGGlyph](repeating: 0, count: count)
            var positions = [CGPoint](repeating: .zero, count: count)
            CTRunGetGlyphs(run, CFRange(location: 0, length: count), &glyphs)
            CTRunGetPositions(run, CFRange(location: 0, length: count), &positions)
            for index in 0..<count {
                guard let glyphPath = CTFontCreatePathForGlyph(font, glyphs[index], nil) else { continue }
                result.addPath(
                    glyphPath,
                    transform: CGAffineTransform(
                        a: 1, b: 0, c: 0, d: -1, tx: positions[index].x, ty: -positions[index].y))
            }
        }
        return Path(result)
    }()

    func path(in rect: CGRect) -> Path {
        let bounds = Self.outline.boundingRect
        guard rect.width > 24, rect.height > 24, bounds.width > 0, bounds.height > 0 else {
            return Path()
        }
        let scale = min((rect.width - 24) / bounds.width, (rect.height - 24) / bounds.height)
        return Self.outline.applying(
            CGAffineTransform(
                a: scale, b: 0, c: 0, d: scale,
                tx: rect.midX - bounds.midX * scale,
                ty: rect.midY - bounds.midY * scale))
    }
}
