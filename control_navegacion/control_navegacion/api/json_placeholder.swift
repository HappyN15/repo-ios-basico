//
//  json_placeholder.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 06/10/25.
//

import Foundation

class ServicioWeb{
    func descargar_datos<T: Codable>(url: String) async -> T?{
        do {
            guard let url = URL(string: url) else { throw ErroresDeRed.url_mala }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.respuesta_erronea }
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.estado_negativo }
            
            guard let respuesta_decodificada = try? JSONDecoder().decode(T.self, from: datos) else { throw ErroresDeRed.falla_al_decodificar_informacion }
            
            return respuesta_decodificada
        }
        
        catch ErroresDeRed.url_mala {
            print("por favor escribie algo que sea una URL")
        }
        
        catch ErroresDeRed.respuesta_erronea {
            print("Al parecer al servidro el esta dando un Stroke")
        }
        
        catch ErroresDeRed.estado_negativo {
            print("Al parecer la url que buscas no existe o el servidor esta ocuopado. Vuelva pronto")
        }
        
        catch ErroresDeRed.falla_al_decodificar_informacion {
            print("Al parecer tus estructuras estan mas escrotas. Por favor, verifica \(type(of: T.self))")
        }
        
        catch {
            print("ALgo salio mal, y no se que es. ")
        }
        
        return nil
    }
}
