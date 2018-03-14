//
//  ViewController.swift
//  ConstellationExplanation
//
//  Created by 이상협 on 2018. 3. 13..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    /*네비게이션 컨트롤러 뒤로가기 버튼
     back button은 popViewController을 이용하면 된다.*/
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

