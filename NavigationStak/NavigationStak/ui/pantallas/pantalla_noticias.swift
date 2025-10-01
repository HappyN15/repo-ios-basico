import SwiftUI

struct PantallaNoticias: View{
    @State var lista_noticias = noticias
    
    var body: some View{
        ScrollView{
            VStack{
                ForEach(lista_noticias){noticia in NavigationLink{
                    PantallaNota(noticia: noticia)
                }label: {
                    Encabezado(noticia_presentar: noticia)
                }}.buttonStyle(.plain)
                Button("Button"){
                    
                }.buttonStyle(.plain)
            }
        }
    }
    
}

#Preview {
    NavigationStack{
        PantallaNoticias()
    }
}
