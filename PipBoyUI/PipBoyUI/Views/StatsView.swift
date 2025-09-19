import SwiftUI


struct StatsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 10) {
                    StatBar(name: "HP", value: 75)
                    StatBar(name: "AP", value: 50)
                    StatBar(name: "RAD", value: 20)
                }
                .padding()
                
                Divider().background(Color.green)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("S.P.E.C.I.A.L")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(.green)
                    
                    StatBar(name: "Strength", value: 80)
                    StatBar(name: "Perception", value: 60)
                    StatBar(name: "Endurance", value: 70)
                    StatBar(name: "Charisma", value: 40)
                    StatBar(name: "Intelligence", value: 90)
                    StatBar(name: "Agility", value: 55)
                    StatBar(name: "Luck", value: 65)
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
        .background(Color.black) // 👈 evita fondo blanco
    }
}
