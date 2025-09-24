import SwiftUI

struct CajaSeleccionada: View {
    @Binding var checado: Bool
    var tamaño: CGFloat = 40
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: tamaño, height: tamaño)
                .cornerRadius(5)
                .foregroundStyle(checado ? .blue: .gray)
                Image(systemName: "checkmark.seal")
                .resizable()
                .scaledToFit()
                .frame(width: tamaño - (tamaño * 0.20))
                .foregroundStyle(checado ? .white: .gray)
                .onTapGesture {
                    checado.toggle()
                }
        }
    }
}
#Preview{
    @Previewable @State var esta_checado: Bool = true
    CajaSeleccionada(checado: $esta_checado)
}
