//
//  noticia.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 29/09/25.
//

import Foundation

enum Prioridades{
    case normal
    case importante
    case sociales
}

struct Noticia: Identifiable{
    var id = UUID()
    
    var titular: String
    var cuerpo: String
    var imagen: String
    var prioridad: Prioridades
    
    init(titular: String, cuerpo: String, imagen: String, prioridad: Prioridades) {
        self.titular = titular
        self.cuerpo = cuerpo
        self.imagen = imagen
        self.prioridad = prioridad
    }
}


/// Seccion de placeholder
let noticias = [
    // NOTICIAS SERIAS
    Noticia(
        titular: "Banco Central anuncia nueva política monetaria para estabilizar economía",
        cuerpo: "El organismo implementará medidas para controlar la inflación y fortalecer el crecimiento económico en los próximos trimestres.",
        imagen: "avogato",
        prioridad: .importante
    ),
    
    Noticia(
        titular: "Cumbre climática global establece nuevos compromisos para reducción de emisiones",
        cuerpo: "Líderes mundiales acuerdan metas más ambiciosas para combatir el cambio climático en reunión de emergencia.",
        imagen: "clima",
        prioridad: .importante
    ),
    
    // NOTICIAS AMARILLISTAS
    Noticia(
        titular: "¡ESCÁNDALO! Famoso actor fue visto teniendo una cena romántica con su ex",
        cuerpo: "Nuestros reporteros captaron el momento exacto del reencuentro que tiene en vilo a la farándula internacional.",
        imagen: "escan-dalo",
        prioridad: .normal
    ),
    
    Noticia(
        titular: "MISTERIO: Vecinos juran haber visto OVNI sobre urbanización exclusiva",
        cuerpo: "Extrañas luces y objetos no identificados mantienen en alerta a residentes de la zona norte.",
        imagen: "ovni",
        prioridad: .normal
    ),
    
    // NOTICIAS CÓMICAS
    Noticia(
        titular: "Policía arresta a hombre disfrazado de pollo por bailar en medio de autopista",
        cuerpo: "El sujeto alegó que estaba practicando para un concurso de baile urbano cuando fue detenido.",
        imagen: "pollo",
        prioridad: .normal
    ),
    
    Noticia(
        titular: "Gato se convierte en alcalde honorario de pequeño pueblo tras ganar elecciones no oficiales",
        cuerpo: "Los habitantes aseguran que 'Whiskers' tiene mejores ideas que los políticos profesionales.",
        imagen: "gato-alcalde",
        prioridad: .importante
    ),
    
    // NOTICIAS DE EVENTOS SOCIALES
    Noticia(
        titular: "La Gala Anual de la Moda reúne a las celebridades más importantes del momento",
        cuerpo: "Vestidos espectaculares y trajes de diseñador marcaron la noche más glamorosa del año.",
        imagen: "gala-moda",
        prioridad: .sociales
    ),
    
    Noticia(
        titular: "Inauguran nuevo centro cultural con exposición de artistas emergentes",
        cuerpo: "La comunidad artística celebra la apertura de este espacio dedicado a promover el talento local.",
        imagen: "centro-cultural",
        prioridad: .sociales
    ),
    
    // NOTICIA EXTRA IMPORTANTE
    Noticia(
        titular: "Descubren nueva vacuna con 95% de efectividad contra virus respiratorio",
        cuerpo: "El avance científico promete revolucionar el tratamiento de enfermedades respiratorias a nivel global.",
        imagen: "vacuna",
        prioridad: .importante
    ),
    
    // NOTICIA SOCIAL EXTRA
    Noticia(
        titular: "Festival gastronómico atrae a miles de visitantes con sabores internacionales",
        cuerpo: "Chefs reconocidos presentaron platillos exclusivos en el evento culinario del año.",
        imagen: "festival-gastronomico",
        prioridad: .sociales
    )
]

