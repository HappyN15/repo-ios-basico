import SwiftUI

struct CajaSeleccionada: View {
    @Binding var checado: Bool
    var tamaño: CGFloat = 25

    var body: some View {
        Button(action: {
            checado.toggle()
        }) {
            Image(systemName: checado ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: tamaño, height: tamaño)
                .foregroundColor(checado ? .blue : .gray)
        }
        .buttonStyle(.plain)
    }
}
