//
//  ViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/28/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    struct Info: Codable {
        let email: String
        let password: String
    }
    var asistente: Asistente?

    @IBOutlet weak var emailLB: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func loginBTN(_ sender: Any) {
        if(emailLB.text != "" && passwordTF.text != ""){
            loginFirebase(email: emailLB.text!, password: passwordTF.text!)
        }else{
            let alert = UIAlertController(title: "Please write your email and password", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                //regreso a la pantalla anterior
                
                
                
            }))
            
            self.present(alert, animated: true, completion: nil)
            // dispatch to main thread to stop activity indicator
        }
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        emailLB.text = "ismael.gonzalez@e-administra.com"
//        passwordTF.text = "Kforum2020"
        
        if (Auth.auth().currentUser != nil){
            let email=Auth.auth().currentUser?.email
            let password = "Kforum2020"
            login(email: email!, password: password)
        }
        
    }
    func loginFirebase(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                 
                 if let error = error {
                     print(error)
                     
                     
                     var titulo="Error"
                     if(error.localizedDescription == "The password is invalid or the user does not have a password."){
                         titulo="Contraseña incorrecta"
                         
                         
                     }else if(error.localizedDescription == "The email address is badly formatted."){
                         titulo="El email no es válido"
                         
                     }else if(error.localizedDescription == "There is no user record corresponding to this identifier. The user may have been deleted."){
                         titulo="Usuario no encontrado"
        
                     }
                     
                     
                     let alert = UIAlertController(title: error.localizedDescription, message: "", preferredStyle: .alert)
                     alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                         NSLog("The \"OK\" alert occured.")
                         //regreso a la pantalla anterior
                         
                         
                         
                     }))
                     
                     self.present(alert, animated: true, completion: nil)
                 }
                 else if let user = user {
                     
                    self.login(email: email, password: password)
                     
                     
                 }
             }
    }
    
    
    func login(email: String, password: String){
        let session = URLSession.shared
                   let url = URL(string: "https://www.kforum2020.com/backend/apps/login_user.php")!
                   var request = URLRequest(url: url)
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
        
        let info = Info(email: email, password: password)
            
        guard let uploadData = try? JSONEncoder().encode(info) else {
        return
        }
        
        let task = session.uploadTask(with: request, from: uploadData) { data, response, error in
              // Do something...
              if let data = data, let dataString = String(data: data, encoding: .utf8) {
                  print(dataString)
                  
                  let decoder = JSONDecoder()
                  guard let asistente = try? decoder.decode(Asistente.self, from: data) else {
                      self.noEncontrado()
                      return
                  }
                  
                  
                  DispatchQueue.main.async(execute: {
                      
                      /// code goes here
                      if(asistente.estado == "0"){
                          print("No encontrado")
                          self.noEncontrado()
                      }else if(asistente.estado == "1"){
                        self.asistente = asistente
                        self.loginCorrecto(asistente:asistente)

                          
                      }
                      
                      
                  })
                  
              }
          }
          
          task.resume()
        
        
        
        
        
    }
    func loginCorrecto(asistente: Asistente){
        
      
        self.performSegue(withIdentifier: "loginCorrecto", sender: self)
    }
    func noEncontrado(){
        
//        UIApplication.shared.endIgnoringInteractionEvents()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barViewControllers = segue.destination as! UITabBarController
        let destinationViewController = barViewControllers.viewControllers?[0] as! InicioViewController
        destinationViewController.asistente = asistente!

        // access the second tab bar
       
    }



}

