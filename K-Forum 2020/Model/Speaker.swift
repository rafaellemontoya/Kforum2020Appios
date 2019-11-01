//
//  Speaker.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation
import UIKit

class Sepeaker{
    var nombre, titulo, id: String
    var imagen: UIImage
    var orden: Int
    init( id: String, nombre: String,titulo: String,imagen: UIImage) {
        self.titulo = titulo
        self.nombre = nombre
        self.id = id
        self.imagen = imagen
        self.orden = 0
    }
}
