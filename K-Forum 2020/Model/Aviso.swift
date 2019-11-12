//
//  Aviso.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation

class Aviso {
    var texto, id, url, color, hora: String
    
    init(id: String,texto: String, url: String){
        self.id = id
        self.texto = texto
        self.url = url
        self.color = "color"
        self.hora = ""
    }
    init(){
        self.id = ""
        self.texto = ""
        self.url = ""
        self.color = ""
        self.hora = ""
    }
}
