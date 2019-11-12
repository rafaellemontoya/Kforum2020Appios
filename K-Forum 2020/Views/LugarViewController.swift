//
//  LugarViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import UberRides
import CoreLocation

class LugarViewController: UIViewController {

    @IBAction func mapa(_ sender: Any) {
        guard let url = URL(string: "https://www.google.com/maps/place/Hilton+Mexico+City+Reforma/@19.434514,-99.146221,12z/data=!4m8!3m7!1s0x0:0xcc366795ad494b89!5m2!4m1!1i2!8m2!3d19.4345141!4d-99.1462206?hl=es") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func uber(_ sender: Any) {

        guard let url = URL(string: "https://m.uber.com/ul/") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func waze(_ sender: Any) {
        guard let url = URL(string: "https://www.waze.com/ul?ll=19.4349796%2C-99.1464219&navigate=yes&zoom=17") else { return }
        UIApplication.shared.open(url)
    }
    
    
    @IBAction func googleMaps(_ sender: Any) {
        guard let url = URL(string: "https://www.google.com/maps/place/Hilton+Mexico+City+Reforma/@19.434514,-99.146221,12z/data=!4m8!3m7!1s0x0:0xcc366795ad494b89!5m2!4m1!1i2!8m2!3d19.4345141!4d-99.1462206?hl=es") else { return }
        UIApplication.shared.open(url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
