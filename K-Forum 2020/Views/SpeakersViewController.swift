//
//  SpeakersViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class SpeakersViewController: UIViewController {

    var array:  [Sepeaker] = []
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.delegate = self
        tabla.dataSource = self
        loadData()
    }
    func loadData(){
        array.append(Sepeaker(id: "id", nombre: "Guadalupe del Valle Perochena", titulo: "Global Futurist and Innovation Strategist", imagen: UIImage(named: "1_speakers-128-x-128")!))
        array.append(Sepeaker(id: "id", nombre: "Antonio del Valle Ruíz", titulo: "Lifetime Honorary Chairman of the Board of Directors of Kaluz", imagen: UIImage(named: "5_speakers-128-x-128")!))
     }


}
extension SpeakersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! DescargaTableViewCell
        cell.agregarCelda(item:array[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "speakerSeleccionadoSG", sender: self)
    }
    
    
}
