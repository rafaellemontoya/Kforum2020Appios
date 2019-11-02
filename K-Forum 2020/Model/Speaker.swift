//
//  Speaker.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation
import UIKit

class Speaker{
    var nombre, titulo, id,imagenSpeaker, plecaSpeaker, biografia: String

    var orden: Int
    init( id: String, nombre: String,titulo: String,imagen: String, pleca: String) {
        self.titulo = titulo
        self.nombre = nombre
        self.id = id
        self.imagenSpeaker = imagen
        self.plecaSpeaker = pleca
        self.orden = 0
        self.biografia = ""
    }
    init(){
        self.titulo = ""
        self.nombre = ""
        self.id = ""
        self.imagenSpeaker = ""
        self.plecaSpeaker = ""
        self.biografia = ""
        self.orden = 0
    }
}
