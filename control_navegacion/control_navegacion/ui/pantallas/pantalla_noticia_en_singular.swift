//
//  pantalla_noticia_en_singular.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 01/10/25.
//

import SwiftUI

struct PantallaNota: View {
    @State var noticia: Noticia
    
    var body: some View {
        VStack{
            Text(noticia.titular)
                .fontWeight(.bold)
                .fontWidth(.expanded)
            
            HStack{
                Image(systemName: "square.and.arrow.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)

                Text(noticia.cuerpo)
            }
            Spacer()
        }
    }
}

#Preview {
    PantallaNota(noticia: noticias[3])
}
