import SwiftUI

struct PantallaOpciones: View{
    @State var valor_slider = 50.0
    var body: some View{
        ScrollView(.horizontal){
            Text("Hola mundo el valor del slider es: \(valor_slider)")
            Slider(value: $valor_slider, in: 0...100)
            Text("Hola mundo el valor del slider es: \(valor_slider)")
            Slider(value: $valor_slider, in: 0...100)
            Text("Hola mundo el valor del slider es: \(valor_slider)")
            Slider(value: $valor_slider, in: 0...100)
            Text("Hola mundo el valor del slider es: \(valor_slider)")
            Slider(value: $valor_slider, in: 0...100)
        }
    }
}

#Preview {
    PantallaOpciones()
}
