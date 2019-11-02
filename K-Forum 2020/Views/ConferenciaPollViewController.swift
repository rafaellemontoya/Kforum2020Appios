//
//  ConferenciaPollViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import FirebaseFirestore
class ConferenciaPollViewController: UIViewController {
    var array:  [ConferenciaQAP] = []
    
    var db: Firestore!
    var pollSeleccionada = ConferenciaQAP()
    let coleccion = "polls"
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Firestore.firestore().settings = FirestoreSettings()
               // [END setup]
        db = Firestore.firestore()
      
            tabla.delegate = self
            tabla.dataSource = self
            loadData()
        }
        
        func loadData(){
            db.collection(coleccion).order(by: "orden").addSnapshotListener{(querySnapshot, err) in
                         if let err = err{
                             print("Error obteniendo documentos \(err)")
                             
                         }else{
                             self.array=[]
                             for document in querySnapshot!.documents{
                                 
                                 if(document.data()["estatus"]as? Int != -1){
                                     let seleccionado = ConferenciaQAP()
                                     seleccionado.id = document.documentID
                                     if let nombre = document.data()["texto"]as? String{
                                         seleccionado.nombre = nombre
                                     }
                                     if let estado = document.data()["estatus"]as? Int{
                                         seleccionado.estado = estado
                                     }
                                     if let orden = document.data()["orden"]as? Int{
                                         seleccionado.orden = orden
                                     }
                                     
                                     self.array.append(seleccionado)
                                 }//if -1
                                
                             }//for
                            self.tabla.reloadData()
                             
                         }//else
                         
                     }//snapshot
                    
                     self.tabla.reloadData()
                
            }//load data
    

    

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
        self.pollSeleccionada = array[indexPath.row]
        performSegue(withIdentifier: "pollSeleccionadaSG", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let receiver = segue.destination as! PollSeleccionadaViewController
               receiver.poll = self.pollSeleccionada
    }
    
    
}
