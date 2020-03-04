//
//  ContactoViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 31/10/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class ContactoViewController: UIViewController {
    
    struct Info: Codable {
        let email: String
        let nombre: String
        let mensaje: String
    }
    struct Respuesta: Decodable {
        let respuesta: String
    }

    @IBOutlet weak var nombreTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var mensajeTF: UITextView!
    
    @IBAction func enviarBTN(_ sender: Any) {
        enviar()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreTF.attributedPlaceholder = NSAttributedString(string: "Name",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailTF.attributedPlaceholder = NSAttributedString(string: "Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        mensajeTF.text = "Message"
        
        // Do any additional setup after loading the view.
    }
    


    func enviar(){
        let session = URLSession.shared
                   let url = URL(string: "https://www.kforum2020.com/backend/apps/contact_mail.php")!
                   var request = URLRequest(url: url)
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
        
        let info = Info(email: emailTF.text!, nombre: nombreTF.text!,mensaje: mensajeTF.text!)
            
        guard let uploadData = try? JSONEncoder().encode(info) else {
        return
        }
        
        let task = session.uploadTask(with: request, from: uploadData) { data, response, error in
              // Do something...
              if let data = data, let dataString = String(data: data, encoding: .utf8) {
                  print(dataString)
                  
                  let decoder = JSONDecoder()
                  guard let respuesta = try? decoder.decode(Respuesta.self, from: data) else {
                      self.noEncontrado()
                      return
                  }
                  
                  
                  DispatchQueue.main.async(execute: {
                      
                      /// code goes here
                      if(respuesta.respuesta == "0"){
                          print("No encontrado")
                          self.noEncontrado()
                      }else if(respuesta.respuesta == "1"){
                       
                        self.emailEnviado()

                          
                      }
                      
                      
                  })
                  
              }
          }
          
          task.resume()
        
        
    }
       func noEncontrado(){
            
    //        UIApplication.shared.endIgnoringInteractionEvents()
            
        }
    func emailEnviado(){
        let alert = UIAlertController(title: "Message sent succesfully", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            //regreso a la pantalla anterior
            
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        // dispatch to main thread to stop activity indicator
        
        
    }

}
