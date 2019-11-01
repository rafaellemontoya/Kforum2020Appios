//
//  Respuesta.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation


class Respuesta{
    var id, texto, idConferencia: String
    var estatus: Int
    
    init(id: String, texto: String, idConferencia: String, estatus: Int){
        self.id = id
        self.texto = texto
        self.idConferencia = idConferencia
        self.estatus = estatus
    }
}
