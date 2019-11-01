//
//  NotificacionesViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class NotificacionesViewController: UIViewController {
 var arrayAvisos: [Aviso] = []
    
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        getInfoAvisos()
        // Do any additional setup after loading the view.
    }
    

        func getInfoAvisos(){
        arrayAvisos.append(Aviso(id: "", texto: "Primer aviso", url: "url"))
    }

}
extension NotificacionesViewController: UITableViewDataSource, UITableViewDelegate{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayAvisos.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! AvisosTableViewCell
    cell.agregarCelda(item: arrayAvisos[indexPath.row])
    return cell
}

}
