//
//  DescargasViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import FirebaseFirestore

class DescargasViewController: UIViewController {
    
    var db: Firestore!
    let coleccion = "descargas"
    var array:  [Descarga] = []
    
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
                         let seleccionado = Descarga()
                        
                         
                         if let titulo = document.data()["conferencia"]as? String{
                             seleccionado.titulo = titulo
                         }
                         if let url = document.data()["url"]as? String{
                             seleccionado.url = url
                         }
                         if let speaker = document.data()["speaker"]as? String{
                             seleccionado.speaker = speaker
                         }
                        
                        
                        seleccionado.imagen = UIImage(named:"09_download-64" )
                        self.array.append(seleccionado)
                     }
                    self.tabla.reloadData()
                     
                 }
                 
             }
            
             self.tabla.reloadData()
        
    }//load data

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: array[indexPath.row].url) else { return }
         UIApplication.shared.open(url)
     }
    
    
    
}
