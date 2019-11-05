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
    
    var imgArr: [String] = []

    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    
    
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
        
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        nombreAsistente.text = asistente!.nombre+" " + asistente!.apellido
        loadData()
    }
    

    

    func loadData(){
         db.collection(coleccion).order(by: "orden").addSnapshotListener{(querySnapshot, err) in
                        if let err = err{
                            print("Error obteniendo documentos \(err)")
                            
                        }else{
                            self.imgArr=[]
                            for document in querySnapshot!.documents{
                                
                                if(document.data()["estado"]as? Int != -1){
                                    print(document.documentID)

                                    if let urlImg = document.data()["url"]as? String{
                                        
                                    self.imgArr.append(urlImg)
                                    }
                                }//if -1
                               
                            }//for
                           self.sliderCollectionView.reloadData()
                            
                        }//else
                        
                    }//snapshot
                   
                    self.sliderCollectionView.reloadData()
               
           }//load data
    


}
extension InicioViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaSlider", for: indexPath) as! SliderCollectionViewCell
        let urlFormado = URL(string: imgArr[indexPath.row])
        let dataImagen = try? Data(contentsOf: urlFormado!)
        cell.imagePerCell.image = UIImage(data: dataImagen!)
        
        return cell
    }
    
    
}

    


