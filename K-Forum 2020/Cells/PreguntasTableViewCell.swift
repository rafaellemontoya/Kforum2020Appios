//
//  PreguntasTableViewCell.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class PreguntasTableViewCell: UITableViewCell {
    
    @IBOutlet weak var estadoPregunta: UILabel!
    
    @IBOutlet weak var nombreConferencia: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func agregarCelda(item: ConferenciaQAP){
        switch item.estado {
        case 1:
//            estadoPregunta.backgroundColor = UIColor.init(red: 150, green: 210, blue: 136, alpha: 1)
            estadoPregunta.backgroundColor = UIColor.red
            estadoPregunta.text = "LIVE"
            break
        case 0:
//            estadoPregunta.backgroundColor = UIColor.init(red: 2, green: 179, blue: 218, alpha: 1)
            estadoPregunta.text = "NOT ACTIVE"
            break
        default:
            estadoPregunta.backgroundColor = UIColor.white
            estadoPregunta.text = ""
            break
        }
        nombreConferencia.text = item.nombre
    }

}
