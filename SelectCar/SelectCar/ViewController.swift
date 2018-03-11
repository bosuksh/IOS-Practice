//
//  ViewController.swift
//  SelectCar
//
//  Created by 이상협 on 2018. 3. 8..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var imageView: UIImageView!
    
    let carCompany = ["teslar", "lamborghini", "porsche"]
    
    var carname = [String]()
    var carImageName = [String]()
    
    let teslaModel = ["tesla s", "tesla x"]
    let porscheModel = ["911", "boxter"]
    let lamborModel = ["aventador","veneno", "huracan"]
    
    let teslaImageName = ["tesla-model-s.jpg","tesla-model-x.jpg"]
    let porscheImageName = ["porsche-911.jpg","porsche-boxter.jpg"]
    let lamborImageName = ["lamborghini-aventador.jpg","lamborghini-veneno.jpg","lamborghini-huracan.jpg"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carname = teslaModel
        carImageName = teslaImageName
        
        imageView.layer.cornerRadius = 50.0
        imageView.layer.masksToBounds = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component  == 0 {
            return carCompany.count
        }
        else {
            return carname.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0  {
            if row == 0 {
                carname = teslaModel
                carImageName = teslaImageName
            }
            else if row == 1 {
                carname = lamborModel
                carImageName = lamborImageName
            }
            else if row == 2 {
                carname = porscheModel
                carImageName = porscheImageName
            }
        }
        imageView.image = UIImage(named: carImageName[pickerView.selectedRow(inComponent: 1)] )
        
        pickerView.reloadComponent(1)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carCompany[row]
        }
        else {
            return carname[row]
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

