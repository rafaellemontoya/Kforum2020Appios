//
//  PerfilTableViewCell.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class PerfilTableViewCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var encabezado: UILabel!
    
    @IBOutlet weak var contenido: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func agregarCelda(item: Perfil){
        imagen.image = item.imagen
        encabezado.text = item.encabezado
        contenido.text = item.valor
    }

}
