//
//  PerfilViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    var array:  [Perfil] = []
    var asistente: Asistente?
    
    @IBOutlet weak var tabla: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.delegate = self
        tabla.dataSource = self
        getData()
    }
    

    func getData(){
        array.append(Perfil(id: 1, valor: "asistente.nombre", encabezado: "Nombre", imagen: UIImage(named: "home-icon-silhouette")!))
        array.append(Perfil(id: 2, valor: "asistente.email", encabezado: "E-mail:", imagen: UIImage(named: "home-icon-silhouette")!))
        array.append(Perfil(id: 3, valor: "asistente.titulo", encabezado: "Job title:", imagen: UIImage(named: "home-icon-silhouette")!))
        array.append(Perfil(id: 4, valor: "asistente.executive", encabezado: "Executive Assistant Name", imagen: UIImage(named: "home-icon-silhouette")!))
        array.append(Perfil(id: 5, valor: "asistente.executive name", encabezado: "Executive Assistant email", imagen: UIImage(named: "home-icon-silhouette")!))
    }
    
    
    
    
}
extension PerfilViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! PerfilTableViewCell
        cell.agregarCelda(item:array[indexPath.row])
        return cell
    }
    
    
}
