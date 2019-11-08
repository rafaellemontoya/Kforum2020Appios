//
//  DetalleAgendaViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 07/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import Firebase

class DetalleAgendaViewController: UIViewController {
    var seleccionado: Agenda?
    var db: Firestore!
    var coleccion = ""
    var array: [DetalleAgenda] = []
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var tituloLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Firestore.firestore().settings = FirestoreSettings()
               // [END setup]
               db = Firestore.firestore()
        
        coleccion = "agenda/"+seleccionado!.id+"/detalle/"
        tituloLB.text = seleccionado?.evento
        tabla.delegate = self
        tabla.dataSource = self
    
    getInfo()
    
    
    }
    

    func getInfo(){
        db.collection(coleccion).order(by: "orden").addSnapshotListener(){(querySnapshot, err) in
             if let err = err{
                 print("Error obteniendo documentos \(err)")
                 
             }else{
                 self.array=[]
                 for document in querySnapshot!.documents{
                     let seleccionado = DetalleAgenda()
                    
                     
                     if let subtitulo = document.data()["subtitulo"]as? String{
                         seleccionado.subtitulo = subtitulo
                     }
                     if let nombre = document.data()["nombre"]as? String{
                         seleccionado.nombre = nombre
                     }
                     if let puesto = document.data()["puesto"]as? String{
                         seleccionado.puesto = puesto
                     }
                    if let strIMG = document.data()["imagen"]as? String{
                        let urlIMGSP = URL(string: strIMG)
                        let dataIMGSP = try? Data(contentsOf: urlIMGSP!)
                        seleccionado.imagen = UIImage(data: dataIMGSP!)
                    }
                    
                    
                    
                     
                    self.array.append(seleccionado)
                 }
                self.tabla.reloadData()
                 
             }
             
         }
        
         
         self.tabla.reloadData()
    }
}
extension DetalleAgendaViewController: UITableViewDataSource, UITableViewDelegate{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! DetalleAgendaTableViewCell
    cell.agregarCelda(item: array[indexPath.row])
    return cell
}

}
