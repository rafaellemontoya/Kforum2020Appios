//
//  Agenda.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation

class Agenda{
    var hora, evento: String
    var id:Int
    
    init(){
        hora = ""
        evento = ""
        id = 0;
    }
    init?(id:Int,hora: String, evento: String){
        self.id = id
        self.hora = hora
        self.evento = evento
    }
}
