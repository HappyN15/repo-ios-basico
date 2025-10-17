import SwiftUI
import Foundation

@Observable
@MainActor
class ControladorGeneral {
    let url_base = "https://jsonplaceholder.typicode.com"
    
    var publicaciones: [Publicacion] = []
    var comentarios: [Comentario] = []
    var usuarios: [Usuario] = []
    
    private var _publicacion_actual: Publicacion? = nil
    
    init() {
        Task {
            await descargar_publicaciones()
            await descargar_usuarios()
        }
    }
    
    func descargar_publicaciones() async {
        guard let publicaciones_descargadas: [Publicacion] =
                await ServicioWeb().descargar_datos(url: "\(url_base)/posts")
        else { return }
        publicaciones = publicaciones_descargadas
    }
    
    func descargar_comentarios(id_publicacion: Int) async {
        guard let comentarios_descargados: [Comentario] =
                await ServicioWeb().descargar_datos(url: "\(url_base)/posts/\(id_publicacion)/comments")
        else { return }
        comentarios = comentarios_descargados
    }
    
    func descargar_comentarios(_ id_publicacion: Int) {
        Task {
            await descargar_comentarios(id_publicacion: id_publicacion)
        }
    }
    
    func publicacion_seleccionada(_ id: Int) {
        for publicacion in publicaciones {
            if publicacion.id == id {
                _publicacion_actual = publicacion
                break
            }
        }
        descargar_comentarios(id)
    }
    
    func descargar_usuarios() async {
        guard let usuarios_descargados: [Usuario] =
                await ServicioWeb().descargar_datos(url: "\(url_base)/users")
        else { return }
        usuarios = usuarios_descargados
    }
    
    func obtenerNombreUsuario(id: Int) -> String? {
        usuarios.first(where: { $0.id == id })?.name
    }
    
    func obtenerUsuario(id: Int) -> Usuario? {
        usuarios.first(where: { $0.id == id })
    }
}
