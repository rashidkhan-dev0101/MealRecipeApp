

import SwiftUI

struct TopWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.35))
        path.addCurve(
            to: CGPoint(x: 0, y: rect.height * 0.35),
            control1: CGPoint(x: rect.width * 0.65, y: rect.height * 1.05),
            control2: CGPoint(x: rect.width * 0.35, y: rect.height * 1.05)
        )
        path.closeSubpath()
        return path
    }
}

struct AuthBackground: View {

    var body: some View {

        ZStack {

            Color.white
                .ignoresSafeArea()

            // Top wave
            TopWaveShape()
                .fill(
                    LinearGradient(
                        colors: [Color.orange, Color.pink, Color.purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 220)
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea(edges: .top)

            // Bottom-left blob
            VStack {
                Spacer()
                HStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.purple, Color.pink.opacity(0.85)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 260, height: 260)
                        .offset(x: -130, y: 90)

                    Spacer()
                }
            }
            .ignoresSafeArea(edges: .bottom)

        }

    }

}
