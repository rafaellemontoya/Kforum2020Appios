//
//  InicioViewController.swift
//  K-Forum 2020
//
//  Created by Rafael Montoya on 10/29/19.
//  Copyright © 2019 Administra Servicios Integrales. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {
    
    var asistente: Asistente?
    
    var arrayAvisos: [Aviso] = []
    
    
    let qrURL = "https://www.registro-eventos.com/core/2019/backend/qrgenerator/generate.php?text="
    
    var imgArr = [UIImage(named:"pleca1"),UIImage(named: "p2"),UIImage(named: "p3")]

    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var nombreAsistente: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: qrURL+asistente!.id)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        
        
        qrImage.image = UIImage(data: data!)
        
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        nombreAsistente.text = asistente!.nombre+" " + asistente!.apellido
        
    }
    

    



}
extension InicioViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celdaSlider", for: indexPath) as! SliderCollectionViewCell
        cell.imagePerCell.image = imgArr[indexPath.row]
        
        return cell
    }
    
    
}

    


