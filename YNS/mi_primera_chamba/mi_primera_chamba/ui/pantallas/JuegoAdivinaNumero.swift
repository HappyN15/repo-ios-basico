//
//  JuegoAdivinaNumero.swift
//  mi_primera_chamba
//
//  Created by alumno on 9/5/25.
//

import SwiftUI
enum 😀{
    case estaJugando
    case Ganar
}

struct 🐒: View{
    @State var entrada: String = ""
    @State var intento = 0
    @State var mostrar = false
    @State var leyenda: String = ""
    @State var estadoJuego: 😀 = 😀.estaJugando
    @State var numAleatorio = Int.random(in: 1...100)
    func registrarIntento(){
        let numeroUsuario = Int(entrada)
        
        //print("La entrada del usuario es: \(numeroUsuario)")
        
        if let numeroUsuario = numeroUsuario{
            print("La entrada  del usuario es: \(numeroUsuario)")
            if (numeroUsuario == numAleatorio){
                leyenda = "Has ganado"
            }
            else if (numeroUsuario > numAleatorio){
                leyenda = "tu numero es mayor"
            }
            else{
                leyenda = "tu numero es menor"
            }
        }
        else{
            leyenda = "F**k of"
        }
        intento += 1
    }
    
    func juego(){
        switch(estadoJuego){
        case .estaJugando:
            registrarIntento()
        case .Ganar:
            
                
        
        }
        
    }
    var body: some View{
        VStack{
            Text("Spoiler \(numAleatorio)")
                .onTapGesture {
                    mostrar = !mostrar
                }
                .foregroundStyle((mostrar) ? Color.black : Color.white)
            
            Spacer()
            
            Text("Reglas")
            Text("Cantidad de intentos: \(intento)")
            
            Spacer()
            
            TextField("introduce u numero por favor", text: $entrada)
                .frame(width: 250)
            Button(action:{
                registrarIntento()
            }){
                Text("intentar")
                Image(systemName: "paperplane.fill")
                
            }
            if (estadoJuego == .Ganar){
                Button(action:  {
                    estadoJuego = .estaJugando
                }){
            }
            Text(leyenda)
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

#Preview{
    🐒()
}


