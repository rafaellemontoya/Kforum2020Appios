//
//  Venue2ViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 07/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class Venue2ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var header: UIImageView!
    
    @IBAction func googleMaps(_ sender: Any) {
        guard let url = URL(string: "https://www.google.com/maps/place/Aut%C3%B3dromo+Hermanos+Rodr%C3%ADguez/@19.4040417,-99.0895156,15z/data=!4m5!3m4!1s0x0:0x33ff6581b240a2dd!8m2!3d19.4040417!4d-99.0895156") else { return }
        UIApplication.shared.open(url)
    }
    
    
    @IBAction func waze(_ sender: Any) {
        
        guard let url = URL(string: "https://www.waze.com/ul?ll=19.4040467%2C-99.0917043&navigate=yes&zoom=17") else { return }
        UIApplication.shared.open(url)
    }
    
    
    @IBAction func uber(_ sender: Any) {
        guard let url = URL(string: "https://m.uber.com/ul/") else { return }
        UIApplication.shared.open(url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        // Your action
        guard let url = URL(string: "https://www.google.com/maps/place/Aut%C3%B3dromo+Hermanos+Rodr%C3%ADguez/@19.4040417,-99.0895156,15z/data=!4m5!3m4!1s0x0:0x33ff6581b240a2dd!8m2!3d19.4040417!4d-99.0895156") else { return }
        UIApplication.shared.open(url)
    }
}
