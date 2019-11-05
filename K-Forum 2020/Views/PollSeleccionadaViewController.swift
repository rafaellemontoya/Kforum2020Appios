//
//  PollSeleccionadaViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

import FirebaseFirestore
import FirebaseAuth

class PollSeleccionadaViewController: UIViewController {
    var array:  [Respuesta] = []
    var poll: ConferenciaQAP?
    
    var respuestaSeleccionada = Respuesta()
    var db: Firestore!
    var coleccion = ""
    
    @IBOutlet weak var nombreConferencia: UILabel!
    @IBOutlet weak var preguntaLB: UILabel!
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Firestore.firestore().settings = FirestoreSettings()
               // [END setup]
        db = Firestore.firestore()
        
        self.coleccion = "polls/"+poll!.id+"/respuestas/"
        tabla.delegate = self
        tabla.dataSource = self
        
        nombreConferencia.text = poll!.nombre
        loadData()
        }
             
    func loadData(){
        db.collection(coleccion).order(by: "orden").addSnapshotListener{(querySnapshot, err) in
                     if let err = err{
                         print("Error obteniendo documentos \(err)")
                         
                     }else{
                         self.array=[]
                         for document in querySnapshot!.documents{
                             
                                 let seleccionado = Respuesta()
                                 seleccionado.id = document.documentID
                                 if let texto = document.data()["texto"]as? String{
                                     seleccionado.texto = texto
                                 }
                                 
                                
                                 
                                 self.array.append(seleccionado)
                             
                            
                         }//for
                        self.tabla.reloadData()
                         
                     }//else
                     
                 }//snapshot
                
                 self.tabla.reloadData()
            
        }//load data
         
    

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
        let alert = UIAlertController(title: "Do you want to submit this answer?", message: "You will not be able to answer again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Submit", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            
            self.respuestaSeleccionada = self.array[indexPath.row]
            self.enviar()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            //regreso a la pantalla
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func enviar(){
        
        var ref: DocumentReference? = nil
        ref = db.collection(coleccion).document(self.respuestaSeleccionada.id)
        ref?.updateData(["cuenta": FieldValue.increment(Int64(1))]){ err in
            if let err = err {
                print("Error updating document: \(err)")
                
            } else {
                print("Document successfully updated")
                self.actualizarUser()
            }
        }

           
     }//enviar
    func actualizarUser(){
//        let email = Auth.auth().currentUser?.email
        let idUser = Auth.auth().currentUser?.uid
        var ref: DocumentReference? = nil
        ref = db.collection("pollsUsuarios/"+idUser!+"/polls/").document(self.poll!.id)
        ref?.setData(["respuesta": respuestaSeleccionada.id]){ err in
            if let err = err {
                print("Error updating document: \(err)")
                
            } else {
                print("Document successfully updated")
                let alert = UIAlertController(title: "Answer submitted succesfully", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    
                    _=self.navigationController?.popViewController(animated: true)
                }))
                
                
                self.present(alert, animated: true, completion: nil)
                 
            }
        }
    }
    
}
