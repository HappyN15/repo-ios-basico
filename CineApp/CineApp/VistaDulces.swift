import SwiftUI

enum TiposDulces: String, CaseIterable, Identifiable {
    case Chocolates, Gomitas, Paletas, Nachos
    var id: Self { self }
}

struct VistaDulces: View {
    @Binding var quiereDulces: Bool
    @Binding var tipo: TiposDulces
    @Binding var cantidad: Int
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Spacer()
                Text("¿Quieres Dulces?")
                Spacer()
                CajaSeleccionada(checado: $quiereDulces, tamaño: 25)
                Spacer()
            }
            
            if quiereDulces {
                Picker("Tipo de Dulce", selection: $tipo) {
                    ForEach(TiposDulces.allCases) { dulce in
                        Text(dulce.rawValue).tag(dulce)
                    }
                }
                .pickerStyle(.segmented)
                
                Stepper("Cantidad: \(cantidad)", value: $cantidad, in: 1...20)
            }
        }
    }
}
