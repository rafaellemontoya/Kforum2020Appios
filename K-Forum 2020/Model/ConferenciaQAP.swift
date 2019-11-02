//
//  Pregunta.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation

class ConferenciaQAP{
    var id, nombre,hora: String
    var estado, quap, orden: Int
    
    init(id: String, nombre: String, hora: String, estado: Int, quap: Int,orden: Int){
        self.id = id
        self.nombre = nombre
        self.hora = hora
        self.estado = estado
        self.quap = quap
        self.orden = orden
    }
    init(){
        self.id = ""
        self.nombre = ""
        self.hora = ""
        self.estado = 0
        self.quap = 0
        self.orden = 0
    }
}
