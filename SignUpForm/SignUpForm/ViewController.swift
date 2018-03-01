//
//  ViewController.swift
//  SignUpForm
//
//  Created by 이상협 on 2018. 3. 1..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var blogTextField: UITextField!
    @IBOutlet weak var TelTextField: UITextField!
    @IBOutlet weak var outputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        nameTextField.resignFirstResponder()
//        mailTextField.resignFirstResponder()
//        passwordTextField.resignFirstResponder()
//        blogTextField.resignFirstResponder()
//        TelTextField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    @IBAction func SignUpAction(_ sender: Any) {
        outputTextView.text = "\(nameTextField.text!)님 가입을 축하드립니다."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

