//
//  AgendaTableViewCell.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var horaLB: UILabel!
    
    @IBOutlet weak var eventoLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func agregarCelda(agenda:Agenda){
        
        horaLB.text = agenda.hora
        eventoLB.text = agenda.evento
        
    }

}
