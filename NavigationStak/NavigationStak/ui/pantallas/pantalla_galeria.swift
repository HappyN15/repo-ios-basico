import SwiftUI

struct PantallaGaleria: View {
    var body: some View {
        Text("Pantalla de Galeria")
        NavigationLink{
         PantallaInicio()
        } label: {
            Text("Ir a Inicio")
        }
    }
}
