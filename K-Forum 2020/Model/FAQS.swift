//
//  FAQS.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 07/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation

class FAQS {
    var pregunta, respuesta: String
    
    init(pregunta:String, respuesta:String){
        self.pregunta = pregunta
        self.respuesta = respuesta
    }
    init(){
        self.pregunta = ""
        self.respuesta = ""
    }
}
