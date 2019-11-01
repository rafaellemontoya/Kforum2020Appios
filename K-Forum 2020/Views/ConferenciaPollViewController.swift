//
//  ConferenciaPollViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class ConferenciaPollViewController: UIViewController {
    var array:  [ConferenciaQAP] = []
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
            tabla.delegate = self
            tabla.dataSource = self
            loadData()
        }
        
        func loadData(){
            array.append(ConferenciaQAP(id: "id", nombre: "Conf 1", hora: "", estado: 1,quap: 1, orden: 1))
            array.append(ConferenciaQAP(id: "id", nombre: "Conf 2", hora: "", estado: 0,quap: 1, orden: 1))
            
            }
    

    

}
extension ConferenciaPollViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! PollsTableViewCell
        cell.agregarCelda(item: array[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pollSeleccionadaSG", sender: self)
    }
    
    
}
