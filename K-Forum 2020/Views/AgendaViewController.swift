//
//  AgendaViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/29/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController {
    
    
    var array:  [Agenda] = []
    var arrayDia2:  [Agenda] = []
    
    var arrayAcompananteDia1:  [Agenda] = []
    var secciones: [String] = ["Dia 1", "Día 2"]
    
    var sectionData: [Int:[Agenda]] = [:]
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getInfoParticipante()
        getInfoAcompanante()
        
    }
    func getInfoAcompanante(){
        arrayAcompananteDia1.append(Agenda(id: 1, hora: "08:00", evento: " acompananrw")!)
        arrayAcompananteDia1.append(Agenda(id: 2, hora: "09:00", evento: "Welcome")!)
        
        
    }
    func getInfoParticipante(){
        array.append(Agenda(id: 1, hora: "08:00", evento: "Registration Opens")!)
        array.append(Agenda(id: 2, hora: "09:00", evento: "Welcome")!)
        array.append(Agenda(id: 3, hora: "09:20", evento: "Leading Change Anders Sörman - Nilsson")!)
        
        
        arrayDia2.append(Agenda(id: 1, hora: "08:00", evento: "Registration Opens")!)
        arrayDia2.append(Agenda(id: 2, hora: "09:00", evento: "Welcome")!)
        arrayDia2.append(Agenda(id: 3, hora: "09:20", evento: "Leading Change\nAnders Sörman - Nilsson")!)
        
        
//        tableView.reloadData()
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
//        array.append(Agenda(id: <#T##Int#>, hora: <#T##String#>, evento: <#T##String#>)!)
        setInfoParticipante()
        
    }
    func setInfoParticipante(){
        sectionData = [0:array,1:arrayDia2]
        tableView.reloadData()
    }
    func setInfoAcompanante(){
        sectionData = [0:arrayAcompananteDia1,1:arrayDia2]
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
