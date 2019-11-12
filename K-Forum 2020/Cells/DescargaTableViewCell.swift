//
//  DescargaTableViewCell.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class DescargaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var speaker: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }


    func agregarCelda(item: Speaker){
        
        self.titulo.text = item.nombre
//        let url = URL(string: item.imagenSpeaker)
//        let data = try? Data(contentsOf: url!)
        self.imagen.image = item.imagen
        self.speaker.text = item.titulo
        
    }
}
