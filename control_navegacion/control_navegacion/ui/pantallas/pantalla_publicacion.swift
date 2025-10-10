import SwiftUI

struct PantallaPublicacion: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var publicacion_actual: Publicacion
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
              
                Text(publicacion_actual.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                
                if let nombre = controlador.obtenerNombreUsuario(id: publicacion_actual.userId) {
                    Text("Por: \(nombre)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                } else {
                    Text("Por: Usuario #\(publicacion_actual.userId)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
               
                Text(publicacion_actual.body)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                
                Divider()
                
            
                Text("Comentarios")
                    .font(.headline)
                    .padding(.bottom, 8)
                
                if controlador.comentarios.isEmpty {
                    ProgressView("Cargando comentarios...")
                        .padding(.vertical)
                } else {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(controlador.comentarios, id: \.id) { comentario in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(comentario.name)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                Text(comentario.body)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                Divider()
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Publicación")
        .navigationBarTitleDisplayMode(.inline)
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
    PantallaPublicacion(
        publicacion_actual: Publicacion(userId: 1, id: 1, title: "404", body: "No encontrado")
    )
    .environment(ControladorGeneral())
}
