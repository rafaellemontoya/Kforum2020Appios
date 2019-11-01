//
//  PollSeleccionadaViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class PollSeleccionadaViewController: UIViewController {
    var array:  [Respuesta] = []
    
    @IBOutlet weak var nombreConferencia: UILabel!
    @IBOutlet weak var preguntaLB: UILabel!
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        loadData()
        }
             
    func loadData(){
        array.append(Respuesta(id: "id", texto: "Conf 1", idConferencia: "", estatus: 0))
        
                 
        }
         
    

}
extension PollSeleccionadaViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! PollSeleccionadaTableViewCell
        cell.agregarCelda(item: array[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pollSeleccionadaSG", sender: self)
    }
    
    
}
