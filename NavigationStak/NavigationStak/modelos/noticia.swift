import Foundation

enum Prioridad{
    case normal
    case importante
    case sociales
}

struct Noticia: Identifiable{
    var id = UUID()
    
    var titular: String
    var cuerpo: String
    var imagen: String
    var prioridad: Prioridad
    
    init(titular: String, cuerpo: String, imagen: String, prioridad: Prioridad) {
        self.titular = titular
        self.cuerpo = cuerpo
        self.imagen = imagen
        self.prioridad = prioridad
    }
}

let noticias = [
    // NOTICIAS SERIAS
        Noticia(
            titular: "Banco Central anuncia nueva política monetaria para estabilizar economía",
            cuerpo: "El organismo implementará medidas para controlar la inflación y fortalecer el crecimiento económico en los próximos trimestres.",
            imagen: "economia",
            prioridad: .importante
        ),
        
        Noticia(
            titular: "Cumbre climática global establece nuevos compromisos para reducción de emisiones",
            cuerpo: "Líderes mundiales acuerdan metas más ambiciosas para combatir el cambio climático en reunión de emergencia.",
            imagen: "clima",
            prioridad: .importante
        ),
        
        Noticia(titular: "Gobierno anuncia ley para prohibir el café los lunes", cuerpo: "Según fuentes no oficiales, el Congreso aprobó una ley que prohíbe el consumo de café los lunes para “mejorar la productividad nacional”. Los ciudadanos reaccionan creando memes de desesperación y cafeterías clandestinas.", imagen: "Cafe", prioridad: .importante),
        Noticia(titular: "Descubren que los gatos en realidad son alienígenas encubiertos", cuerpo: "Un supuesto “documento filtrado” revela que los gatos fueron enviados por una civilización alienígena para estudiar a los humanos. El plan maestro incluye exigir caricias a cambio de información secreta.", imagen: "Galien", prioridad: .importante),
        Noticia(titular: "NASA confirma que Marte tiene una cadena de restaurantes de comida rápida", cuerpo: "Un informe filtrado muestra que la NASA descubrió una franquicia interplanetaria de hamburguesas en Marte llamada “MartBurger”. El menú incluiría “Hamburguesa Cósmica” y “Papas Meteorito”.", imagen: "Marte", prioridad: .normal),
        Noticia(titular: "Nuevo récord mundial: hombre bate récord de comer pizza en gravedad cero", cuerpo: "En un experimento llevado a cabo en la Estación Espacial Internacional, un astronauta devoró 15 pizzas en 5 minutos. El evento fue transmitido en vivo y ganó trending topic mundial.", imagen: "Pizza", prioridad: .sociales)
]
