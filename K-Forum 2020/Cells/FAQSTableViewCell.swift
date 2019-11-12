//
//  FAQSTableViewCell.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 07/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class FAQSTableViewCell: UITableViewCell {
    
    @IBOutlet weak var texto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func agregarCelda(pregunta: FAQS){
        texto.text = pregunta.pregunta
    }

}
