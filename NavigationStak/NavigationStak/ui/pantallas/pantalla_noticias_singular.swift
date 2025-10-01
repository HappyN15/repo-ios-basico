import SwiftUI

struct PantallaNota: View {
    @State var noticia: Noticia
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // Titular
            Text(noticia.titular)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.blue)
                .padding(.horizontal)
                .padding(.top, 20)
            
            // Cuerpo con icono
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "square.and.arrow.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(
                        Circle()
                            .fill(Color.blue.opacity(0.8))
                    )
                
                Text(noticia.cuerpo)
                    .font(.body)
                    .foregroundStyle(Color.primary.opacity(0.9))
                    .lineLimit(nil)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                colors: [Color.white, Color.blue.opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
        .padding()
    }
}

#Preview {
    PantallaNota(noticia: noticias[1])
}
