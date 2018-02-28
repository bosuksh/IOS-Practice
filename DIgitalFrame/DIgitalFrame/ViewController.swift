//
//  ViewController.swift
//  DIgitalFrame
//
//  Created by 이상협 on 2018. 2. 28..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cuteImages = [UIImage.init(named:"1.jpg")!,
                          UIImage.init(named:"2.jpg")!,
                          UIImage.init(named:"3.jpg")!,
                          UIImage.init(named:"4.jpg")!,
                          UIImage.init(named:"5.jpg")!,
                          UIImage.init(named:"6.jpg")!,
                          UIImage.init(named:"7.jpg")!,
                          UIImage.init(named:"8.jpg")!,
                          UIImage.init(named:"9.jpg")!,
                          UIImage.init(named:"10.jpg")!,
                          UIImage.init(named:"11.jpg")!,
                          UIImage.init(named:"12.jpg")!,
                          UIImage.init(named:"13.jpg")!,
                          UIImage.init(named:"14.jpg")!,
                          UIImage.init(named:"15.jpg")!
                          ]
        
        imgView.animationImages = cuteImages
        imgView.animationDuration = 15
        
    }
    
    @IBAction func toggleButton(_ sender: Any){
        
        if imgView.isAnimating {
            imgView.stopAnimating()
            toggleButton.setTitle("Start", for: UIControlState.normal)
        }
        else {
            imgView.animationDuration = Double(speedSlider.value)
            imgView.startAnimating()
            toggleButton.setTitle("Stop", for: UIControlState.normal)
        }
    }
    @IBAction func  speedOfSliderAction(_ sender: Any) {
        imgView.animationDuration = Double(speedSlider.value)
        imgView.startAnimating()
        toggleButton.setTitle("Stop", for: UIControlState.normal)
        Label.text = String(format:"%d",Int(speedSlider.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

