//
//  DescargasViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class DescargasViewController: UIViewController {
    
    var array:  [Descarga] = []
    
    @IBOutlet weak var tabla: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.delegate = self
        tabla.dataSource = self
        loadData()
    }
    
    func loadData(){
        array.append(Descarga(titulo: "Título Conferencia", speaker: "Nombre speaker", url: "url", imagen: UIImage(named: "home-icon-silhouette")!))
    }
    

   

}
extension DescargasViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! DescargaTableViewCell
        cell.agregarCelda(item:array[indexPath.row])
        return cell
    }
    
    
}
