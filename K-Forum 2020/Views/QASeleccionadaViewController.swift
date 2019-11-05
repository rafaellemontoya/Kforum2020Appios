//
//  QASeleccionadaViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 01/11/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

import FirebaseFirestore
import FirebaseAuth

class QASeleccionadaViewController: UIViewController {
    
    var qa: ConferenciaQAP?
    var db: Firestore!
    var coleccion = ""
    
    
    @IBOutlet weak var nombreConferencia: UILabel!
    
    @IBOutlet weak var textoPregunta: UITextView!
    
    @IBAction func enviarBTN(_ sender: Any) {
        if(textoPregunta.text! != ""){
            enviar()
        }else{
            let alert = UIAlertController(title: "Please write your question", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                //regreso a la pantalla
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coleccion = "qa/"+self.qa!.id+"/preguntas"
        Firestore.firestore().settings = FirestoreSettings()
               // [END setup]
        db = Firestore.firestore()
               
        nombreConferencia.text = qa?.nombre
        
        
    }
    
    func enviar(){
        let email = Auth.auth().currentUser?.email
        let idUser = Auth.auth().currentUser?.uid
            var ref: DocumentReference? = nil
            ref = db.collection(coleccion).addDocument(data:[
                "id_usuario": idUser,
                "email": email,
                "texto": textoPregunta.text!,
                "hora": NSDate().timeIntervalSince1970
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                    
                } else {
                    let alert = UIAlertController(title: "Question sent succesfully", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                        NSLog("The \"OK\" alert occured.")
                        //regreso a la pantalla
                         _=self.navigationController?.popViewController(animated: true)
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                }

        }
    }
    
    
    
    



}
