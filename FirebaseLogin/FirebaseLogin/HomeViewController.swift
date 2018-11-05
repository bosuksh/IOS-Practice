//
//  HomeViewController.swift
//  FirebaseLogin
//
//  Created by 이상협 on 03/11/2018.
//  Copyright © 2018 이상협. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

   
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = Auth.auth().currentUser?.email
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
