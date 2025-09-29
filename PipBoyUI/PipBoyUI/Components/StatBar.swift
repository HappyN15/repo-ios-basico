import SwiftUI

struct StatBar: View {
    var label: String
    var value: Double // entre 0.0 y 1.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label.uppercased())
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(.green)
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.green, lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 4).fill(Color.black))
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.green)
                        .frame(width: CGFloat(value) * geo.size.width)
                }
            }
            .frame(height: 16)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 12) {
            StatBar(label: "Strenght", value: 0.75)
            StatBar(label: "Perception", value: 0.45)
            StatBar(label: "Endurance", value: 0.9)
            StatBar(label: "Charisma", value: 0.1)
            StatBar(label: "Intelligence", value: 0.2)
            StatBar(label: "Agility", value: 0.5)
            StatBar(label: "Luck", value: 0.3)
        }
        .padding()
    }
}


