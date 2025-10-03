import SwiftUI


enum Pestañas{
    case Inicio
    case Configuracion
    case Galeria
    case Noticias
}

struct NavigationStak: View {
    @State var pestaña_actual: Pestañas = .Inicio
    var body: some View {
        NavigationStack{
            
            TabView(selection: $pestaña_actual){
                Tab("Watch Now", systemImage: "play", value: .Inicio){
                    NavigationStack{
                        PantallaInicio()
                    }
                }
                .badge("IDK")
                Tab("Noticias", systemImage: "newspaper", value: .Noticias){
                    NavigationStack{
                        PantallaNoticias()
                    }
                }
                .badge(noticias.count)
                Tab("Galeria", systemImage: "photo.artframe", value: .Galeria){
                    NavigationStack{
                        PantallaGaleria()
                    }
                }
                Tab("Configuracion", systemImage: "gear",value: .Configuracion){
                    NavigationStack{
                        PantallaConfig()
                    }
                }
            }
        }
    }
}
#Preview {
    NavigationStak()
}
