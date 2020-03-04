//
//  MenuViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    
    var array:  [Menu] = []
     var db: Firestore!
    let coleccion = "menu"
    @IBOutlet weak var tabla: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.delegate = self
        tabla.dataSource = self
        tabla.backgroundColor = UIColor.white
        Firestore.firestore().settings = FirestoreSettings()
               // [END setup]
               db = Firestore.firestore()

        cargarDatos()
    }
    
    func cargarDatos(){
        db.collection(coleccion).addSnapshotListener(){(querySnapshot, err) in
             if let err = err{
                 print("Error obteniendo documentos \(err)")
                 
             }else{
                self.array=[]
                 for document in querySnapshot!.documents{
                    if(document.data()["activo"]as? Int == 1){
                        self.array.append(Menu(id:0,texto:"My profile", imagen: UIImage(named: "06_profile-64")! ))
                               
                               self.array.append(Menu(id:1,texto:"Venue", imagen: UIImage(named: "08_venue-64")! ))
                               self.array.append(Menu(id:2,texto:"Venue Day Two", imagen: UIImage(named: "08_venue-64")! ))
                               
                               
                               self.array.append(Menu(id:3,texto:"Contact us", imagen: UIImage(named: "11_contact-64")! ))
                               self.array.append(Menu(id:4,texto:"FAQs", imagen: UIImage(named: "10_help-64")! ))
                               
                               self.array.append(Menu(id:5,texto:"Log-out", imagen: UIImage(named: "13_logout-24")! ))
                    }else{
                        self.array.append(Menu(id:0,texto:"My profile", imagen: UIImage(named: "06_profile-64")! ))
                        self.array.append(Menu(id:1,texto:"Venue", imagen: UIImage(named: "08_venue-64")! ))
                                                      
                                                      
                                                      
                                                      self.array.append(Menu(id:3,texto:"Contact us", imagen: UIImage(named: "11_contact-64")! ))
                                                      self.array.append(Menu(id:4,texto:"FAQs", imagen: UIImage(named: "10_help-64")! ))
                                                      
                                                      self.array.append(Menu(id:5,texto:"Log-out", imagen: UIImage(named: "13_logout-24")! ))
                    }
                }
                self.tabla.reloadData()
            }
        };
       
    }
    



}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! MenuTableViewCell
        cell.agregarCelda(menu:array[indexPath.row])
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.white
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch array[indexPath.row].id {

        case 0:
            performSegue(withIdentifier: "perfilSG", sender: self)
        case 1:
            performSegue(withIdentifier: "lugarSG", sender: self)
            case 2:
            performSegue(withIdentifier: "venue2SG", sender: self)
        case 3:
            performSegue(withIdentifier: "contactoSG", sender: self)
        case 4:
            performSegue(withIdentifier: "faqsSG", sender: self)
            
                
        case 5:
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                print("sesion cerrada")
                performSegue(withIdentifier: "logoutSG", sender: self)
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
                
            }
            
        default:
            print("hola")
        }
    }
    
   
    
    
}
