import SwiftUI

struct PantallaPublicacion: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var publicacion_actual: Publicacion
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(publicacion_actual.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 4)
            
            Text(publicacion_actual.body)
                .font(.body)
                .foregroundColor(.secondary)
            
            if let nombre = controlador.obtenerNombreUsuario(id: publicacion_actual.userId),
               let usuario = controlador.obtenerUsuario(id: publicacion_actual.userId) {
                NavigationLink(destination: PantallaPerfil(usuario: usuario)) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                        Text("Por: \(nombre)")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.top, 8)
            } else {
                Text("Por: Usuario #\(publicacion_actual.userId)")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
            Divider().padding(.vertical)
            
            Text("💬 Comentarios")
                .font(.headline)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(controlador.comentarios, id: \.id) { comentario in
                        VStack(alignment: .leading) {
                            Text(comentario.name)
                                .font(.subheadline)
                                .bold()
                            Text(comentario.body)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    }
                }
                .padding(.bottom)
            }
        }
        .padding()
        .navigationTitle("Publicación")
        .onAppear {
            if controlador.comentarios.isEmpty {
                Task {
                    await controlador.descargar_comentarios(id_publicacion: publicacion_actual.id)
                }
            }
        }
    }
}
#Preview {
    NavigationStack {
        PantallaPublicacion(publicacion_actual: Publicacion(userId: 1, id: 1, title: "404", body: "No encontrado"))
    }
    .environment(ControladorGeneral()) // ✅ Para @Observable (nuevo sistema)
}
