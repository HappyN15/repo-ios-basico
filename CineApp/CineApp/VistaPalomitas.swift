import SwiftUI

enum SaboresPalomitas: String, CaseIterable, Identifiable {
    case Mantequilla, Natural, QuesoCheddar, Doritos
    var id: Self { self }
}

struct VistaPalomitas: View {
    @Binding var quierePalomitas: Bool
    @Binding var sabor: SaboresPalomitas
    @Binding var cantidad: Double
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Spacer()
                Text("¿Quieres Palomitas?")
                Spacer()
                CajaSeleccionada(checado: $quierePalomitas, tamaño: 25)
                Spacer()
            }
            
            if quierePalomitas {
                VStack(spacing: 10) {
                    Text("¿Cuál sabor?")
                    
                    Picker("Sabor de Palomitas", selection: $sabor) {
                        ForEach(SaboresPalomitas.allCases) { sabor in
                            Text(sabor.rawValue).tag(sabor)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("¿Cuántas Palomitas quieres?")
                    
                    HStack {
                        Slider(value: $cantidad, in: 1...400, step: 1)
                        Text("\(Int(cantidad))")
                            .frame(width: 40)
                    }
                }
            }
        }
    }
}
