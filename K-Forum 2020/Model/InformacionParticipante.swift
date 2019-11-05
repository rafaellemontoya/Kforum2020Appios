//
//  InformacionParticipante.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 02/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation
class InformacionParticipante: Decodable{
    var id, nombre,email, puesto, nombreAsistente,emailAsistente,empresa,requerimientosDieta, requerimientosEspecales,
    fechaLlegada, fechaSalida, taller, nombreAcompanante,requerimientosDietaAcompanante,requerimientosEspecialesAcompanante,estado, requiereHotel: String
    
    
    init(){
        id=""
        nombre=""
        email=""
        puesto=""
        nombreAsistente=""
        emailAsistente=""
        empresa=""
        requerimientosDieta=""
        requerimientosEspecales=""
        fechaLlegada=""
        fechaSalida=""
        taller=""
        nombreAcompanante=""
        requerimientosDietaAcompanante=""
        estado=""
        requerimientosEspecialesAcompanante = ""
        requiereHotel = ""
    }
}
