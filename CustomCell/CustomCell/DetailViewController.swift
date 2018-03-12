//
//  DetailViewController.swift
//  CustomCell
//
//  Created by 이상협 on 2018. 3. 13..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailData = [String:String]()

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var ValueLabel: UILabel!
    @IBOutlet weak var ImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(detailData)
        
        ImgView.layer.cornerRadius = 50.0
        ImgView.layer.masksToBounds = true
        
        NameLabel.text = "과일: \(detailData["name"]!)"
        NameLabel.textColor = UIColor.white
        AmountLabel.text = "수량: \(detailData["amount"]!)"
        AmountLabel.textColor = UIColor.white
        ValueLabel.textColor = UIColor.white
        ValueLabel.text = "가격: \(detailData["value"]!)"
        
        ImgView.image = UIImage(named: detailData["image"]!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
