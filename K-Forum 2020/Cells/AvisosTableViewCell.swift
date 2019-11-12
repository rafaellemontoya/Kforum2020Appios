//
//  AvisosTableViewCell.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class AvisosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var texto: UILabel!
    
    @IBOutlet weak var hora: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func agregarCelda(item: Aviso){
        self.texto.text = item.texto
        self.hora.text = item.hora
        
    }

}
