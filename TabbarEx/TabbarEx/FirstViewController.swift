//
//  FirstViewController.swift
//  TabbarEx
//
//  Created by 이상협 on 2018. 3. 11..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func ButtonAction(_ sender: Any) {
        outputLabel.text = "1번 버튼이 눌렸습니다."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

