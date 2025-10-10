//
//  control_navegacionApp.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 29/09/25.
//

import SwiftUI

@main
struct control_navegacionApp: App {
    @State var controlador_app = ControladorGeneral()
    
    var body: some Scene {
        WindowGroup {
            NavegacionPrincipal()
                .environment(controlador_app)
        }
    }
}
