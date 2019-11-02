//
//  SpeakersViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import FirebaseFirestore


class SpeakersViewController: UIViewController {

     var db: Firestore!
    let coleccion = "speakers"
    
    var array:  [Speaker] = []
    var speakerSeleccionado = Speaker()
    
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
                     let seleccionado = Speaker()
                    seleccionado.id = document.documentID
                     
                     if let titulo = document.data()["titulo"]as? String{
                         seleccionado.titulo = titulo
                     }
                     if let nombre = document.data()["nombre"]as? String{
                         seleccionado.nombre = nombre
                     }
                     if let imagen = document.data()["imagen"]as? String{
                         seleccionado.imagenSpeaker = imagen
                     }
                    if let plecaSpeaker = document.data()["plecaSpeaker"]as? String{
                         seleccionado.plecaSpeaker = plecaSpeaker
                     }
                    if let biografia = document.data()["biografia"]as? String{
                        seleccionado.biografia = biografia
                    }
                    
                     
                    self.array.append(seleccionado)
                 }
                self.tabla.reloadData()
                 
             }
             
         }

         self.tabla.reloadData()
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
        self.speakerSeleccionado = array[indexPath.row]
        performSegue(withIdentifier: "speakerSeleccionadoSG", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiver = segue.destination as! SpeakerSeleccionadoViewController
        receiver.speaker = self.speakerSeleccionado
    }
    
    
}
