//
//  DetalleAgenda.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 07/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation
import UIKit
class DetalleAgenda {
    var subtitulo, nombre, puesto: String
    var imagen: UIImage?
    
    init(subtitulo: String, nombre: String, puesto: String){
        self.subtitulo = subtitulo
        self.nombre = nombre
        self.puesto = puesto
        
    }
    init(){
        self.subtitulo = ""
        self.nombre = ""
        self.puesto = ""
    }
}
