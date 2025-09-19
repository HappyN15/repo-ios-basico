import SwiftUI


struct MapView: View {
    let points: [CGPoint] = [
        CGPoint(x: 0.2, y: 0.3),
        CGPoint(x: 0.5, y: 0.6),
        CGPoint(x: 0.8, y: 0.2)
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            GeometryReader { geo in
                ZStack {
                    // Líneas de cuadrícula
                    ForEach(0..<11) { i in
                        Path { path in
                            let spacingX = geo.size.width / 10
                            path.move(to: CGPoint(x: CGFloat(i) * spacingX, y: 0))
                            path.addLine(to: CGPoint(x: CGFloat(i) * spacingX, y: geo.size.height))
                        }
                        .stroke(Color.green.opacity(0.3), lineWidth: 1)
                        
                        Path { path in
                            let spacingY = geo.size.height / 10
                            path.move(to: CGPoint(x: 0, y: CGFloat(i) * spacingY))
                            path.addLine(to: CGPoint(x: geo.size.width, y: CGFloat(i) * spacingY))
                        }
                        .stroke(Color.green.opacity(0.3), lineWidth: 1)
                    }
                    
                    // Puntos de interés
                    ForEach(points.indices, id: \.self) { i in
                        let point = points[i]
                        Circle()
                            .fill(Color.green)
                            .frame(width: 12, height: 12)
                            .position(x: point.x * geo.size.width, y: point.y * geo.size.height)
                    }
                }
            }
            .padding()
        }
    }
}
