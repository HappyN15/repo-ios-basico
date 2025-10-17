import SwiftUI

struct PantallaPublicacion: View {
    @Environment(ControladorGeneral.self) var controlador
    var publicacion_actual: Publicacion
    
    var body: some View {
        ZStack {
            // Fondo con degradado sutil
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Título principal
                    Text(publicacion_actual.title.capitalized)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.bottom, 4)
                    
                    // Cuerpo de la publicación dentro de una tarjeta
                    Text(publicacion_actual.body)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 3)
                        )
                    
                    // Autor con link al perfil
                    if let nombre = controlador.obtenerNombreUsuario(id: publicacion_actual.userId),
                       let usuario = controlador.obtenerUsuario(id: publicacion_actual.userId) {
                        NavigationLink(destination: PantallaPerfil(usuario: usuario)) {
                            HStack(spacing: 10) {
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.blue)
                                Text("Publicado por \(nombre)")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.blue.opacity(0.1))
                            )
                        }
                        .buttonStyle(.plain)
                    } else {
                        Text("Publicado por: Usuario #\(publicacion_actual.userId)")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    Divider().padding(.vertical, 10)
                    
                    // Sección de comentarios
                    Text("💬 Comentarios")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    VStack(spacing: 12) {
                        ForEach(controlador.comentarios, id: \.id) { comentario in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(comentario.name)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                                Text(comentario.body)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.white)
                                    .shadow(color: .gray.opacity(0.1), radius: 3, x: 0, y: 2)
                            )
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Publicación")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            if controlador.comentarios.isEmpty {
                await controlador.descargar_comentarios(id_publicacion: publicacion_actual.id)
            }
        }
    }
}

#Preview {
    NavigationStack {
        PantallaPublicacion(
            publicacion_actual: Publicacion(
                userId: 1,
                id: 1,
                title: "404",
                body: "Contenido de ejemplo de la publicación con diseño mejorado para mostrar estilo visual."
            )
        )
    }
    .environment(ControladorGeneral())
}
