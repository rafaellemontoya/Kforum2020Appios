//
//  Agenda.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation

class Agenda{
    var hora, evento,id: String
    var abre:Int
    
    init(){
        hora = ""
        evento = ""
        id = "";
        abre = 0
    }
    init?(id:String,hora: String, evento: String, abre:Int){
        self.id = id
        self.hora = hora
        self.evento = evento
        self.abre = abre
    }
}
