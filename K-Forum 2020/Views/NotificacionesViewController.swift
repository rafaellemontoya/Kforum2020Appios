//
//  NotificacionesViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import FirebaseFirestore

class NotificacionesViewController: UIViewController {
    var db: Firestore!
    let coleccion = "notificaciones"
    var array: [Aviso] = []
    
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Firestore.firestore().settings = FirestoreSettings()
        // [END setup]
        db = Firestore.firestore()
        
        tabla.delegate = self
        tabla.dataSource = self
        tabla.backgroundColor = UIColor.white
        getInfoAvisos()
        // Do any additional setup after loading the view.
    }
    

    func getInfoAvisos(){
        db.collection(coleccion).order(by: "orden").addSnapshotListener(){(querySnapshot, err) in
             if let err = err{
                 print("Error obteniendo documentos \(err)")
                 
             }else{
                 self.array=[]
                 for document in querySnapshot!.documents{
                    if(document.data()["estatus"]as? Int == 1){
                     let seleccionado = Aviso()
                    seleccionado.id = document.documentID
                     
                     if let texto = document.data()["texto"]as? String{
                         seleccionado.texto = texto
                     }
                    if let hora = document.data()["fecha"]as? String{
                        seleccionado.hora = hora
                    }
                     if let url = document.data()["url"]as? String{
                         seleccionado.url = url
                     }
                     if let color = document.data()["color"]as? String{
                         seleccionado.color = color
                     }
                    
                    
                     
                    self.array.append(seleccionado)
                    }//if
                 }//for
                self.tabla.reloadData()
                 
             }
             
         }
        
         
         self.tabla.reloadData()
    }

}
extension NotificacionesViewController: UITableViewDataSource, UITableViewDelegate{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! AvisosTableViewCell
    cell.agregarCelda(item: array[indexPath.row])
    let bgColorView = UIView()
    bgColorView.backgroundColor = UIColor.white
    cell.selectedBackgroundView = bgColorView
    return cell
}

}
