//
//  publicacion.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 06/10/25.
//


struct Publicacion: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
