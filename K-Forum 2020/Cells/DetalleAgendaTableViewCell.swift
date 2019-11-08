//
//  DetalleAgendaTableViewCell.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 07/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class DetalleAgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var subtituloLB: UILabel!
    
    @IBOutlet weak var nombreLB: UILabel!
    
    @IBOutlet weak var puestoLB: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func agregarCelda(item: DetalleAgenda){
        
        subtituloLB.text = item.subtitulo
        nombreLB.text = item.nombre
        puestoLB.text = item.puesto
        imagen.image = item.imagen!
        
    }

}
