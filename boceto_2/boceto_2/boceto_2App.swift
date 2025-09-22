

import SwiftUI

@main
struct boceto_2App: App {
    @State var controlador = ControladorBasico()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(controlador)
        }
    }
}
