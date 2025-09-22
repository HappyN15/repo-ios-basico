//
//  ContentView.swift
//  boceto_2
//
//  Created by alumno on 22/9/25.
//

import SwiftUI

enum Pantallas{
    case pantalla_1
    case pantalla_2
    case pantalla_3
}

struct ContentView: View {
    @State var pantalla_actual: Pantallas = .pantalla_1
    
    var body: some View{
        Text("Cambiar pantalla")
            .onTapGesture {
                if pantalla_actual == .pantalla_1{
                    pantalla_actual = .pantalla_2
                }
                else{
                    pantalla_actual = .pantalla_1
                }
                else if{
                    
                }
            }
        switch(pantalla_actual){
        case .pantalla_1:
            Pantalla1()
            
        case .pantalla_2:
            Pantalla2()
        }
    }
}

#Preview {
    ContentView()
        .environment(ControladorBasico())
}
