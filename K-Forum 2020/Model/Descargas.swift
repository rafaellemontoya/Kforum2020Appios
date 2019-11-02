//
//  Descargas.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import Foundation
import UIKit

class Descarga {
    var titulo, speaker, url: String
    var imagen: UIImage?
    init(titulo: String, speaker: String, url: String,imagen: UIImage) {
        self.titulo = titulo
        self.speaker = speaker
        self.url = url
        self.imagen = imagen
    }
    init(){
        self.titulo = ""
        self.speaker = ""
        self.url = ""
        
    }

}
