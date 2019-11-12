//
//  Asistente.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/29/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation

class Asistente: Decodable {
    var id, nombre, apellido,estado: String
    var tipo : Int
    
    init() {
        id = ""
        nombre = ""
        apellido = ""
        estado = ""
        tipo = 0 ;
    }
}
