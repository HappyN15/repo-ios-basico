import SwiftUI

struct Encabezado: View {
    var noticia_presentar: Noticia = Noticia(
        titular: "404",
        cuerpo: "No Encontrado",
        imagen: "X",
        prioridad: .importante
    )
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            // Imagen desde Assets
            Image("Aquila")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle()) // Forma circular
                .shadow(radius: 4)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(noticia_presentar.titular)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                    .lineLimit(1)
                
                Text(noticia_presentar.cuerpo)
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
            }
            Spacer()
        }
        .frame(height: 80)
        .padding(10)
        .background {
            Rectangle()
                .foregroundStyle(Color.blue)
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    Encabezado()
}
