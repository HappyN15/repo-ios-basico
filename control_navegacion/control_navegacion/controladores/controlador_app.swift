//
//  controlador_app.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 03/10/25.
//
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
    
    // 🔹 Nueva función para descargar usuarios
    func descargar_usuarios() async {
        guard let usuarios_descargados: [Usuario] =
                await ServicioWeb().descargar_datos(url: "\(url_base)/users")
        else { return }
        
        usuarios = usuarios_descargados
    }
    
    // 🔹 Nueva función para obtener el nombre del usuario por id
    func obtenerNombreUsuario(id: Int) -> String? {
        return usuarios.first(where: { $0.id == id })?.name
    }
}
