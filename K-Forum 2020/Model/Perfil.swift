//
//  Perfil.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation
import UIKit

class Perfil{
    var valor, encabezado: String
    var id: Int
    var imagen: UIImage?
    
    init(id: Int, valor: String, encabezado: String, imagen: UIImage){
        self.id = id
        self.valor = valor
        self.encabezado = encabezado
        self.imagen = imagen
    }
}
