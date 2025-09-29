import SwiftUI

struct Encabezado: View {
    var noticia_presentar: Noticia = Noticia(titular: "404", cuerpo: "No Encontrado", imagen: "X", prioridad: .importante)
    var body: some View {
        HStack{
            Image(systemName: "list.bullet.rectangle").resizable().scaledToFit().frame(width:100)
            VStack{
                Text(noticia_presentar.titular)
                Spacer()
            }
            HStack{
                Text(noticia_presentar.cuerpo)
                Spacer()
            }
        }
    }
}

#Preview {
    Encabezado()
}
