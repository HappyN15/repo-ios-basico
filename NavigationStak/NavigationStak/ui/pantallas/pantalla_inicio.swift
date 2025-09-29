import SwiftUI

struct PantallaInicio: View {
    var body: some View {
        VStack{
            Text("Bienvenidos al Himalaya")
            
            NavigationLink{
                PantallaConfig()
            } label: {
                Text("Ir a pantalla de configuracion")
            }
            
            NavigationLink{
                PantallaGaleria()
            } label: {
                Text("Ir a pantalla de galeria")
            }
        }
    }
}

#Preview {
    NavigationStack{
        PantallaInicio()
    }
}
