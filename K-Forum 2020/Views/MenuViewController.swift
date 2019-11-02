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
    
    @IBOutlet weak var tabla: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.delegate = self
        tabla.dataSource = self

        cargarDatos()
    }
    
    func cargarDatos(){
        array.append(Menu(id:0,texto:"My profile", imagen: UIImage(named: "06_profile-64")! ))
        array.append(Menu(id:1,texto:"Q & A", imagen: UIImage(named: "07_qr-64")! ))
        array.append(Menu(id:2,texto:"Venue", imagen: UIImage(named: "08_venue-64")! ))
        
        array.append(Menu(id:3,texto:"Download content", imagen: UIImage(named: "09_download-64")! ))
        array.append(Menu(id:4,texto:"Contact us", imagen: UIImage(named: "11_contact-64")! ))
        array.append(Menu(id:5,texto:"Help", imagen: UIImage(named: "10_help-64")! ))
        array.append(Menu(id:6,texto:"Poll", imagen: UIImage(named: "12_poll-64")! ))
        array.append(Menu(id:7,texto:"Log-out", imagen: UIImage(named: "12_poll-64")! ))
    }
    



}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! MenuTableViewCell
        cell.agregarCelda(menu:array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {

        case 0:
            performSegue(withIdentifier: "perfilSG", sender: self)
        case 1:
            performSegue(withIdentifier: "qaSG", sender: self)
        case 2:
            performSegue(withIdentifier: "lugarSG", sender: self)
        case 3:
            performSegue(withIdentifier: "descargasSG", sender: self)
        case 4:
            performSegue(withIdentifier: "contactoSG", sender: self)

            case 6:
                performSegue(withIdentifier: "pollSG", sender: self)
        case 7:
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
