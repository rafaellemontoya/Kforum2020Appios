//
//  ViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/28/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    struct Info: Codable {
        let email: String
        let password: String
    }
    var asistente: Asistente?

    @IBOutlet weak var emailLB: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func loginBTN(_ sender: Any) {
        
        login()
        
    }
    
    @IBAction func scanQRBTN(_ sender: Any) {
    }
    
    @IBAction func registerBTN(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func login(){
        let session = URLSession.shared
                   let url = URL(string: "https://www.kforum2020.com/backend/apps/login_user.php")!
                   var request = URLRequest(url: url)
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
        
        let info = Info(email: emailLB.text!, password: passwordTF.text!)
            
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
        let receiver = segue.destination as! InicioViewController
        receiver.asistente = self.asistente
    }


}

