//
//  FAQSSeleccionadaViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 07/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class FAQSSeleccionadaViewController: UIViewController {

    var seleccionada: FAQS?
    
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var respuesta: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titulo.text = seleccionada?.pregunta
        respuesta.backgroundColor = UIColor.white
        respuesta.text = seleccionada?.respuesta
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
