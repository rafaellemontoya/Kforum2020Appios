//
//  Menu.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation
import UIKit

class Menu{
    var texto: String
    var imagen: UIImage?
    var id: Int
    
    init(){
        texto = ""
        id=0
        
        
    }
    
    init(id: Int,texto: String, imagen: UIImage){
        self.id = id
        self.texto = texto
        self.imagen = imagen
    }
    
    
    
}
