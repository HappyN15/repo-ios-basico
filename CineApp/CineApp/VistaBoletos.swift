import SwiftUI

struct VistaBoletos: View {
    @Binding var cantidadBoletos: Int
    
    var body: some View {
        VStack(spacing: 15) {
            Text("¿Cuántos boletos deseas?")
                .font(.headline)
            
            Stepper("Boletos: \(cantidadBoletos)", value: $cantidadBoletos, in: 1...10)
        }
    }
}


