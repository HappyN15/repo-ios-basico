import SwiftUI

enum SaboresSoda: String, CaseIterable, Identifiable {
    case DrSlurp, DungeonMist, LootBeer, RegalCola
    var id: Self { self }
}

struct VistaSodas: View {
    @Binding var quiereSoda: Bool
    @Binding var sabor: SaboresSoda
    @Binding var cantidad: Int
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Spacer()
                Text("¿Quieres Soda?")
                Spacer()
                CajaSeleccionada(checado: $quiereSoda, tamaño: 25)
                Spacer()
            }
            
            if quiereSoda {
                Picker("Sabor de Soda", selection: $sabor) {
                    ForEach(SaboresSoda.allCases) { sabor in
                        Text(sabor.rawValue).tag(sabor)
                    }
                }
                .pickerStyle(.segmented)
                
                Stepper("Cantidad: \(cantidad)", value: $cantidad, in: 1...10)
            }
        }
    }
}
