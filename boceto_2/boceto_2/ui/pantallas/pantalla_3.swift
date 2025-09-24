import SwiftUI

enum SaboresPalomitas: String, CaseIterable, Identifiable {
    case Mantequilla
    case Natural
    case QuesoCheddar
    case Doritos

    var id: Self { self }
}

struct PantallaOpciones: View {
    @State private var quiere_palomitas: Bool = false
    @State private var saboresPalomitas: SaboresPalomitas = .Mantequilla
    @State private var cantidadPalomitas: Double = 1
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Formulario para calcular la cantidad de palomitas")
                    .font(.headline)
                

                HStack {
                    Spacer()
                    Text("¿Quieres Palomitas?")
                    Spacer()
                    CajaSeleccionada(checado: $quiere_palomitas, tamaño: 25)
                    Spacer()
                }
                
                if quiere_palomitas { // 👉 solo mostrar si quiere palomitas
                    VStack(spacing: 15) {
                        Text("¿Cuál sabor?")
                        
                        Picker("Sabor de Palomitas", selection: $saboresPalomitas) {
                            Text("Mantequilla").tag(SaboresPalomitas.Mantequilla)
                            Text("Natural").tag(SaboresPalomitas.Natural)
                            Text("Queso Cheddar").tag(SaboresPalomitas.QuesoCheddar)
                            Text("Doritos").tag(SaboresPalomitas.Doritos)
                        }
                        .pickerStyle(.segmented)
                        

                        Text("¿Cuántas Palomitas quieres?")
                        
                        HStack {
                            Slider(value: $cantidadPalomitas, in: 1...400, step: 1)
                            Text("\(Int(cantidadPalomitas))")
                                .frame(width: 40)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    PantallaOpciones()
}
