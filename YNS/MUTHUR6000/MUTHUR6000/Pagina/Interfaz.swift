import SwiftUI

struct MUTHUR6000: View {
    @State private var Input: String = ""
    @State private var Output: [String] = [
        "MU/TH/UR SYSTEM ONLINE...",
        "USER IDENTIFIED: CREW MEMBER #3",
        "ENTER QUERY BELOW:",
        "1. CREW STATUS",
        "2. ALIEN PRESENCE",
        "3. OVERRIDE LOCKDOWN",
        "4. LAUNCH SHUTTLE",
        " ",
        " "
    ]
    
    // Estado fijo de tripulación
    private let crewStatus: String = "ALL CREW ACCOUNTED FOR. 7 ACTIVE."
    
    // Posiciones posibles del Alien
    private let alienLocations = [
        "DECK A",
        "DECK B",
        "DECK C",
        "ENGINE ROOM",
        "CARGO BAY",
        "MEDICAL LAB"
    ]
    
    // Estado dinámico del alien
    @State private var alienActivity: String = "UNKNOWN ENTITY DETECTED IN DECK C."
    
    var body: some View {
        Image(imagen1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(Output, id: \.self) { line in
                            Text(line)
                                .font(.system(.body, design: .monospaced))
                                .foregroundColor(.green)
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                
                HStack {
                    Text("> ")
                        .foregroundColor(.green)
                        .font(.system(.body, design: .monospaced))
                    TextField("", text: $Input, onCommit: processInput)
                        .foregroundColor(.green)
                        .font(.system(.body, design: .monospaced))
                        .textFieldStyle(PlainTextFieldStyle())
                        .accentColor(.green)
                }
                .padding(.top)
            }
            .padding()
        }
        .preferredColorScheme(.dark)
        .onAppear {
            startAlienActivity()
        }
    }
    
    /// Procesa la entrada del usuario
    private func processInput() {
        if !Output.isEmpty {
            Output.removeLast(2)
        }
        
        Output.append("> " + Input.uppercased())
        
        switch Input.lowercased() {
        case "1":
            Output.append(crewStatus) // Estado constante
        case "2":
            Output.append(alienActivity) // Actividad dinámica
        case "3":
            Output.append("LOCKDOWN OVERRIDE DENIED. AUTHORIZATION REQUIRED.")
        case "4":
            Output.append("SHUTTLE PREPARATION INITIATED. ETA: 05:00 MIN.")
        default:
            Output.append("QUERY NOT RECOGNIZED.")
        }
        
        Input = ""
    }
    
    /// Simulación del alien en movimiento
    private func startAlienActivity() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            let newLocation = alienLocations.randomElement() ?? "UNKNOWN"
            alienActivity = "UNKNOWN ENTITY DETECTED IN \(newLocation)."
        }
    }
}

#Preview {
    MUTHUR6000()
}
