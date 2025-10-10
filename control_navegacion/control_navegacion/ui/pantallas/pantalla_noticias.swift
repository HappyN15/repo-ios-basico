//
//  pantalla_noticias.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 29/09/25.
//
import SwiftUI

struct PantallaNoticias: View {
    @State var lista_noticias = noticias
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(controlador.publicaciones) { publicacion in
                        
                        NavigationLink{
                            PantallaPublicacion(publicacion_actual: publicacion)
                        } label: {
                            Encabezado(publicacion: publicacion)
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
            }
        }.onAppear {
            if controlador.publicaciones.isEmpty{
                Task{
                    await controlador.descargar_publicaciones()
                }
            }
        }
    }
}

#Preview {
    PantallaNoticias()
        .environment(ControladorGeneral())
}

