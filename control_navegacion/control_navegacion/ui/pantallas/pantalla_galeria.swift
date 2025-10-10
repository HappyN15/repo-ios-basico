//
//  pantalla_galeria.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 29/09/25.
//
import SwiftUI

struct PantallaGaleria: View {
    var body: some View {
        Text("Pantalla de galeria")
        NavigationLink{
            PantallaInicio()
        } label: {
            Text("Ir a inicio")
        }
    }
}
