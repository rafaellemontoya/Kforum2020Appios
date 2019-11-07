//
//  InicioViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/29/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import FirebaseFirestore

class InicioViewController: UIViewController {
    
    var asistente: Asistente?
    var db: Firestore!
    let coleccion = "slider"
    
    
    
    let qrURL = "https://www.registro-eventos.com/core/2019/backend/qrgenerator/generate.php?text="
    
    

    
    
    
    
    
    @IBOutlet weak var imagenHeader: UIImageView!
    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var nombreAsistente: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Firestore.firestore().settings = FirestoreSettings()
               // [END setup]
        db = Firestore.firestore()
        
        let url = URL(string: qrURL+asistente!.id)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        
        
        qrImage.image = UIImage(data: data!)
        
     
        nombreAsistente.text = asistente!.nombre+" " + asistente!.apellido
        loadData()
    }
    

    

    func loadData(){
         db.collection(coleccion).order(by: "orden").addSnapshotListener{(querySnapshot, err) in
                        if let err = err{
                            print("Error obteniendo documentos \(err)")
                            
                        }else{
                            
                            for document in querySnapshot!.documents{
                                
                                if(document.data()["estado"]as? Int != -1){
                                    print(document.documentID)
//                                    print(document.data["url_img"])
                                    if let urlImg = document.data()["imagen"]as? String{
                                        
                                    
                                        let urlHeader = URL(string: urlImg)
                                        let dataHeader = try? Data(contentsOf: urlHeader!)
                                        self.imagenHeader.image = UIImage(data: dataHeader!)
                                        
                                    }
                                    if let estado = document.data()["estado"]as? Int{
                                        print(estado)
//                                    self.imgArr.append(estado)
                                                                       }
                                    
                                    
                                }//if -1
                               
                            }//for
                           
                            
                        }//else
                        
                    }//snapshot
                   
                    
               
           }//load data
    


}


    


