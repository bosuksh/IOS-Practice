//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by 이상협 on 30/10/2018.
//  Copyright © 2018 이상협. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class ViewController: UIViewController, GIDSignInUIDelegate,FBSDKLoginButtonDelegate{
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult?, error: Error!) {
        if result?.token == nil {
            return
        }
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                return
            }
            // User is signed in
            // ...
        }
        FBSDKLoginManager().logOut()

    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        return
    }
    

    @IBAction func signIn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()

    }
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func Login(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            // ...
            
            if (error != nil ) {
                print(error?.localizedDescription)
                
                Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!, completion: {(user, err) in
                    
                })
                return
                
            } else {
          
                let alert  = UIAlertController(title: "알림", message: "회원가입완료", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert,animated: true, completion: nil)
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        facebookLoginButton.delegate  = self
        
        Auth.auth().addStateDidChangeListener({ (user,err) in
            if user != nil {
                self.performSegue(withIdentifier: "home", sender: nil)
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

}

