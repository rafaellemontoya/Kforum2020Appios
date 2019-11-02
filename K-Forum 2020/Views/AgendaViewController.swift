//
//  AgendaViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/29/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AgendaViewController: UIViewController {
    var db: Firestore!
    
    var nombreReporteBD = ""
    
    var array:  [Agenda] = []
    var arrayDia2:  [Agenda] = []
    
    var arrayAcompananteDia1:  [Agenda] = []
    var arrayAcompananteDia2:  [Agenda] = []
    var secciones: [String] = ["Dia 1", "Día 2"]
    
    var sectionData: [Int:[Agenda]] = [:]
    let coleccion = "agenda"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var scSegment: UISegmentedControl!
    
    @IBAction func scSegmentTapped(_ sender: Any) {
        print(scSegment.selectedSegmentIndex)
        if(scSegment.selectedSegmentIndex==1){
            setInfoAcompanante()
        }
        if(scSegment.selectedSegmentIndex==0){
            setInfoParticipante()
        }
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = FirestoreSettings()
        nombreReporteBD = "";
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getInfoParticipante()
        getInfoAcompanante()
        
    }
    func getInfoAcompanante(){
        db.collection(coleccion).whereField("participante", isEqualTo: 2).getDocuments(){(querySnapshot, err) in
            if let err = err{
                print("Error obteniendo documentos \(err)")
                
            }else{
                
                for document in querySnapshot!.documents{
                    let seleccionado = Agenda()
                    
                    
                    if let hora = document.data()["hora"]as? String{
                        seleccionado.hora = hora
                    }
                    if let evento = document.data()["evento"]as? String{
                        seleccionado.evento = evento
                    }
                    
                    if(document.data()["dia"]as? Int == 1){
                        self.arrayAcompananteDia1.append(seleccionado)
                    }else{
                        self.arrayAcompananteDia2.append(seleccionado)
                    }
                    
                    
                    
                }
                self.setInfoParticipante()
                
            }
            
        }
        
        
    }
    func getInfoParticipante(){
        db.collection(coleccion).whereField("participante", isEqualTo: 1).getDocuments(){(querySnapshot, err) in
            if let err = err{
                print("Error obteniendo documentos \(err)")
                
            }else{
                
                for document in querySnapshot!.documents{
                    let seleccionado = Agenda()
                    
                    
                    if let hora = document.data()["hora"]as? String{
                        seleccionado.hora = hora
                    }
                    if let evento = document.data()["evento"]as? String{
                        seleccionado.evento = evento
                    }
                    
                    if(document.data()["dia"]as? Int == 1){
                        self.array.append(seleccionado)
                    }else{
                        self.arrayDia2.append(seleccionado)
                    }
                    
                    
                    
                }
                self.setInfoParticipante()
                
            }
            
        }
       
        
        setInfoParticipante()
        
    }
    func setInfoParticipante(){
        sectionData = [0:array,1:arrayDia2]
        tableView.reloadData()
    }
    func setInfoAcompanante(){
        sectionData = [0:arrayAcompananteDia1,1:arrayAcompananteDia2]
        tableView.reloadData()
    }


}
extension AgendaViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[section]?.count)!
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return secciones.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 193, blue: 213, alpha: 1)
        label.text = secciones[section]
        label.frame = CGRect(x: 45, y: 0, width: 100, height: 35)
        view.frame.size.height = 100
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        view.addSubview(label)
        
        return view
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! AgendaTableViewCell
        cell.agregarCelda(agenda:sectionData[indexPath.section]![indexPath.row])
        return cell
    }
    
    
}
