import SwiftUI

struct PantallaOpciones: View {
    @State private var quierePalomitas = false
    @State private var saborPalomitas: SaboresPalomitas = .Mantequilla
    @State private var cantidadPalomitas: Double = 1

    @State private var quiereSoda = false
    @State private var saborSoda: SaboresSoda = .DrSlurp
    @State private var cantidadSoda = 1

    @State private var quiereDulces = false
    @State private var tipoDulce: TiposDulces = .Chocolates
    @State private var cantidadDulce = 1

    @State private var cantidadBoletos = 1

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Formulario de Pedido en el Cine")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                VistaPalomitas(
                    quierePalomitas: $quierePalomitas,
                    sabor: $saborPalomitas,
                    cantidad: $cantidadPalomitas
                )

                VistaSodas(
                    quiereSoda: $quiereSoda,
                    sabor: $saborSoda,
                    cantidad: $cantidadSoda
                )

                VistaDulces(
                    quiereDulces: $quiereDulces,
                    tipo: $tipoDulce,
                    cantidad: $cantidadDulce
                )

                VistaBoletos(
                    cantidadBoletos: $cantidadBoletos
                )
            }
            .padding()
        }
    }
}

#Preview {
    PantallaOpciones()
}
