//
//  ViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/28/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import FirebaseFirestore

class ViewController: UIViewController, UITextFieldDelegate {
    struct Info: Codable {
        let email: String
        let password: String
    }
    var blackSquare: UIView!
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
        
        blackSquare = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        let imageName = "splash_2732-X-2732.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        imageView.contentMode = .scaleAspectFill
        blackSquare.addSubview(imageView)
        blackSquare.backgroundColor = UIColor.black
        
        
        view.addSubview(blackSquare)
        
        delegarTF()
        if (Auth.auth().currentUser != nil){
            let email=Auth.auth().currentUser?.email
            let password = "Kforum2020"
            
            login(email: email!, password: password)
            
        }else{
            blackSquare.removeFromSuperview()
        }
        
    }
    func loginFirebase(email: String, password: String){
        CustomLoader.instance.showLoaderView()
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                 
                 if let error = error {
                     print(error)
                     
                     
                     var titulo="The password or email is incorrect"
                     if(error.localizedDescription == "The password is invalid or the user does not have a password."){
                         titulo="The password is invalid or the user does not have a password."
                         
                         
                     }else if(error.localizedDescription == "The email address is badly formatted."){
                         titulo="The email address is badly formatted."
                         
                     }else if(error.localizedDescription == "There is no user record corresponding to this identifier."){
                         titulo="The password is invalid or the user does not have a password."
        
                     }
                     
                     CustomLoader.instance.hideLoaderView()
                     let alert = UIAlertController(title: titulo, message: "", preferredStyle: .alert)
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
        var s = CustomLoader()
        s.showLoaderView()
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
                        self.saveData(id:Auth.auth().currentUser!.uid, tipo: asistente.tipo)

                          
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
        CustomLoader.instance.hideLoaderView()
    }

     func delegarTF(){
        self.emailLB.delegate = self
        self.passwordTF.delegate = self;
        }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        emailLB.resignFirstResponder()
        passwordTF.resignFirstResponder()
        self.view.endEditing(true)
        return true
    }
    
 
    func saveData(id:String,tipo: Int)  {
        var token = ""
        InstanceID.instanceID().instanceID { (result, error) in
          if let error = error {
            print("Error fetching remote instance ID: \(error)")
          } else if let result = result {
            print("Remote instance ID token: \(result.token)")
            token = result.token
            let db: Firestore!
            Firestore.firestore().settings = FirestoreSettings()
            // [END setup]
            db = Firestore.firestore()
            let ref = db.collection("users").document(id)
            ref.setData([
                "email": Auth.auth().currentUser?.email,
                 "token": token,
                 "tipo": tipo
             ]) { err in
                 if let err = err {
                     print("Error updating document: \(err)")
                 } else {
                     print("Document successfully updated")
                 }
             }
          }
        }
        
        
    }
}

