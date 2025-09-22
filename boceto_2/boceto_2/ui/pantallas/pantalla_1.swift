import SwiftUI

struct Pantalla1 : View {
    @Environment(ControladorBasico.self) var controlador
    
        var body: some View{
            VStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text ("Cantidad de clicks es: \(controlador.clicks)")
            }
            .onTapGesture {
                controlador.clicks += 1
            }
            .padding()
        }
}
#Preview {
    Pantalla1()
        .environment(ControladorBasico())
}
