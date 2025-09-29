import SwiftUI

struct StatsView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("ESTADÍSTICAS")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundColor(.green)
                
                StatBar(label: "Strenght", value: 0.75)
                StatBar(label: "Perception", value: 0.45)
                StatBar(label: "Endurance", value: 0.90)
                StatBar(label: "Charisma", value: 0.10)
                StatBar(label: "Intelligence", value: 0.20)
                StatBar(label: "Agility", value: 0.40)
                StatBar(label: "Luck", value: 0.70)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    StatsView()
}

