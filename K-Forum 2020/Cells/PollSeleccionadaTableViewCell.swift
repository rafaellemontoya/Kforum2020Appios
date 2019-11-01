//
//  PollSeleccionadaTableViewCell.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class PollSeleccionadaTableViewCell: UITableViewCell {

    @IBOutlet weak var respuestaLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func agregarCelda(item: Respuesta){
            
            respuestaLB.text = item.texto
        }
    

}
