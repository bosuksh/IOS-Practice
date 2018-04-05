//
//  LoginViewController.swift
//  HyupTalk
//
//  Created by 이상협 on 2018. 4. 1..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    let remoteConfg = RemoteConfig.remoteConfig()
    var color : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //firebase를 이용하면 무조건 로그인 되어있기 때문에 로그아웃을 시켜줘야한다.
        try! Auth.auth().signOut()
        
        
        let statusBar = UIView()
        self.view.addSubview(statusBar)
        statusBar.snp.makeConstraints {(m) in
            m.right.top.left.equalTo(self.view)
            m.height.equalTo(20)
        }
        color = remoteConfg["splash_background"].stringValue

        
        statusBar.backgroundColor = UIColor(hex: color)
        loginButton.backgroundColor = UIColor(hex: color)
        signUpButton.backgroundColor = UIColor(hex: color)
        //회원가입버튼에 기능추가
        signUpButton.addTarget(self, action: #selector(presentSignUp), for: .touchUpInside)
        
        //login버튼에 기능추가
        loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        Auth.auth().addStateDidChangeListener{ (auth, user) in
            
            if(user != nil) {
                
                let view = self.storyboard?.instantiateViewController(withIdentifier: "MainViewTabbarController") as! UITabBarController
                
                self.present(view ,animated: true,completion: nil)
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    //login Event
    @objc func loginEvent() {
        
        //계정에서 로그인 기능
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) {(user,err) in
            //에러있을시 창을 띄우고 확인버튼 및 에러 출력
            if(err != nil) {
                let alert = UIAlertController(title: "에러", message: err.debugDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alert,animated: true,completion: nil)
            }
        }
    }
    @objc func presentSignUp() {
        let view  = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(view, animated: true, completion: nil)
        
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
