//
//  moelcula_encabezado.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 29/09/25.
//

import SwiftUI
import SceneKit


struct Encabezado: View {
    var publicacion: Publicacion = Publicacion(
        userId: 1, id: 1, title: "-404", body: "No encontrado"
    )
    
    var body: some View {
        HStack(spacing: 10){
            /*Image(noticia_presentar.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape( Circle() )*/
            
            VStack{
                HStack{
                    Text(publicacion.title)
                        .lineLimit(1)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.red)
                    
                    Spacer()
                }
                
                //Spacer()
                
                HStack{
                    Text(publicacion.body)
                        .lineLimit(2)
                    Spacer()
                }
            }
        }
        .frame(minHeight: 50, idealHeight: 75, maxHeight: 100)
        .padding(10)
        .background{
            Rectangle()
                .foregroundStyle(Color.blue)
                .cornerRadius(10)
                //.padding(-10)
        }
        .padding(5)
        
    }
}

#Preview {
    Encabezado()
}
