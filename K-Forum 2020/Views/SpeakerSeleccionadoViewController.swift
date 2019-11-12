//
//  SpeakerSeleccionadoViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class SpeakerSeleccionadoViewController: UIViewController {

    var speaker: Speaker?
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var texto: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomLoader.instance.showLoaderView()
        // Do any additional setup after loading the view.
        let url = URL(string: speaker!.plecaSpeaker)
        let data = try? Data(contentsOf: url!)
        self.imagen.image = UIImage(data: data!)
        texto.backgroundColor = UIColor.white
        texto.text = speaker?.biografia
        CustomLoader.instance.hideLoaderView()
        
    }
    



}
