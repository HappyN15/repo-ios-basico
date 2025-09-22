import SwiftUI

struct Pantalla2: View {
    @Environment(ControladorBasico.self) var controlador
    
    var body: some View {
        VStack{
            Image(systemName: "square.and.arrow.up")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text ("Bienvenido a la Pantalla 2 donde los clicks valen: \(controlador.clicks)")
        }
        .onTapGesture {
            controlador.clicks += 1
        }
        .padding()
    }
}

#Preview {
    Pantalla2()
        .environment(ControladorBasico())
}


