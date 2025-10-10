//
//  errores.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 06/10/25.
//

enum ErroresDeRed: Error{
    case url_mala // Que hay una idreccion mal esgrima
    case peticion_invalida // Existe un error en la peticion HTTP
    case respuesta_erronea // Los datos recibidos son incorrectos
    case estado_negativo // Algo diferente al StatusCode: 200 de HTTP
    case falla_al_decodificar_informacion // LA cajetie al escribir el modelo.
}

