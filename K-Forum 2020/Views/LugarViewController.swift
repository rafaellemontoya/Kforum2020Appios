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

    @IBAction func gmaps(_ sender: Any) {
        guard let url = URL(string: "https://goo.gl/maps/x2Si83cTTJkxuU93A") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func uber(_ sender: Any) {
//        let builder = RideParametersBuilder()
//        let pickupLocation = CLLocation(latitude: 37.787654, longitude: -122.402760)
//        let dropoffLocation = CLLocation(latitude: 37.775200, longitude: -122.417587)
//        builder.pickupLocation = pickupLocation
//        builder.dropoffLocation = dropoffLocation
//        builder.dropoffNickname = "UberHQ"
//        builder.dropoffAddress = "1455 Market Street, San Francisco, California"
//        let rideParameters = builder.build()
//
//        let deeplink = RequestDeeplink(rideParameters: rideParameters, fallbackType: .mobileWeb)
//        deeplink.execute()
    }
    
    @IBAction func waze(_ sender: Any) {
       guard let url = URL(string: "https://www.waze.com/ul?ll=19.434855%2C-99.146284&navigate=yes&zoom=17") else { return }
        UIApplication.shared.open(url)
    }
    
    
    @IBAction func mapa(_ sender: Any) {
        guard let url = URL(string: "https://goo.gl/maps/x2Si83cTTJkxuU93A") else { return }
        UIApplication.shared.open(url)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
