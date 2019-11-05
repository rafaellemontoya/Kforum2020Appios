//
//  PerfilViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/30/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import FirebaseAuth

class PerfilViewController: UIViewController {
    struct Info: Codable {
        let email: String
        
    }
    var array:  [Perfil] = []
    var asistente: Asistente?
    
    @IBOutlet weak var tabla: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.delegate = self
        tabla.dataSource = self
        getData()
    }
    

    func getData(){
        let session = URLSession.shared
                   let url = URL(string: "https://www.kforum2020.com/backend/apps/user_info.php")!
                   var request = URLRequest(url: url)
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                   request.setValue("Powered by Swift!", forHTTPHeaderField: "X-Powered-By")
        let email = Auth.auth().currentUser?.email
        let info = Info(email: email!)
            
        guard let uploadData = try? JSONEncoder().encode(info) else {
        return
        }
        
        let task = session.uploadTask(with: request, from: uploadData) { data, response, error in
              // Do something...
              if let data = data, let dataString = String(data: data, encoding: .utf8) {
                  print(dataString)
                  
                  let decoder = JSONDecoder()
                  guard let asistente = try? decoder.decode(InformacionParticipante.self, from: data) else {
                      
                      return
                  }
                  
                  
                  DispatchQueue.main.async(execute: {
                      
                      /// code goes here
                      if(asistente.estado == "0"){
                          print("No encontrado")
                          
                      }else if(asistente.estado == "1"){
                        
                        self.array.append(Perfil(id: 1, valor: asistente.nombre, encabezado: "Name"))
                        self.array.append(Perfil(id: 2, valor: asistente.email, encabezado: "E-mail"))
                        self.array.append(Perfil(id: 3, valor: asistente.puesto, encabezado: "Job title"))
                        self.array.append(Perfil(id: 4, valor: asistente.nombreAsistente, encabezado: "Executive Assistant Name"))
                        self.array.append(Perfil(id: 6, valor: asistente.emailAsistente, encabezado: "Executive Assistant email"))
                        self.array.append(Perfil(id: 7, valor: asistente.empresa, encabezado: "Company"))
                        self.array.append(Perfil(id: 8, valor: asistente.requerimientosDieta, encabezado: "Dietary restrictions"))
                        self.array.append(Perfil(id: 9, valor: asistente.requerimientosEspecales, encabezado: "Special requirements"))
                        if(asistente.fechaLlegada != ""){
                            self.array.append(Perfil(id: 10, valor: asistente.fechaLlegada, encabezado: "Arrival date"))
                            self.array.append(Perfil(id:11, valor: asistente.fechaSalida, encabezado: "Departure date"))
                        }
                        self.array.append(Perfil(id: 11, valor: asistente.taller, encabezado: "Customer-Centricity | Session"))
                        if(asistente.nombreAcompanante != ""){
                            self.array.append(Perfil(id: 12, valor: asistente.nombreAcompanante, encabezado: "Significant other name"))
                            self.array.append(Perfil(id: 13, valor: asistente.requerimientosDietaAcompanante, encabezado: "Significant other dietary restrictions"))
                            
                            self.array.append(Perfil(id: 14, valor: asistente.requerimientosEspecialesAcompanante, encabezado: "Significant other Special requirements"))
                        }
                        
                        self.tabla.reloadData()
                        

                          
                      }
                      
                      
                  })
                  
              }
          }
          
          task.resume()
        
        
        
        
    }
    
    
    
    
}
extension PerfilViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tabla.dequeueReusableCell(withIdentifier: "cell") as! PerfilTableViewCell
        cell.agregarCelda(item:array[indexPath.row])
        return cell
    }
    
    
}
