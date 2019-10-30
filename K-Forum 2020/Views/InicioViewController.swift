//
//  InicioViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/29/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {
    
    var asistente: Asistente?
    
    let qrURL = "https://www.registro-eventos.com/core/2019/backend/qrgenerator/generate.php?text="
    @IBOutlet weak var qrImage: UIImageView!
    
    @IBOutlet weak var nombreAsistenteLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: qrURL+asistente!.id)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        qrImage.image = UIImage(data: data!)
        nombreAsistenteLB.text = asistente!.nombre+" " + asistente!.apellido

    }
    



}
