//
//  SignUpViewController.swift
//  HyupTalk
//
//  Created by 이상협 on 2018. 4. 1..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var cancel: UIButton!
    
    let remoteConfig = RemoteConfig.remoteConfig()
    var color: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBar = UIView()
        self.view.addSubview(statusBar) //statusbar 위치 잡아주기
        statusBar.snp.makeConstraints {(m) in
            m.right.top.left.equalTo(self.view)
            m.height.equalTo(20)
        }
        /*status bar 설정하기*/
        color = remoteConfig["splash_background"].stringValue
        statusBar.backgroundColor = UIColor(hex: color)
        
        //이미지 추가하는 함수 Call
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(imagePicker)))
        
        
        signUp.backgroundColor = UIColor(hex: color)
        cancel.backgroundColor = UIColor(hex: color)
        
        
        /*signUp버튼과 cancel버튼에 Action 주기*/
        signUp.addTarget(self, action: #selector(signUpEvent), for: .touchUpInside)
        cancel.addTarget(self, action: #selector(cancelEvent), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func imagePicker() {
        // 이미지를 추가하는 함수
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {// imageView에 이미지를 담아주는 함수
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    // SignUp 함수 파이어베이스 DB에 넣기,사진및 로그인 정보
    
    @objc func signUpEvent() {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user,err) in
            let uid = user?.uid
            let image = UIImageJPEGRepresentation(self.imageView.image!, 0.1)
            
            //storage에 image를 저장한다.
            Storage.storage().reference().child("userImages").child(uid!).putData(image!, metadata: nil, completion: {(data,err) in
                
                //db에 이미지 URL을 올린다.
                let imageUrl = data?.downloadURL()?.absoluteString
                Database.database().reference().child("users").child(uid!).setValue(["name" : self.name.text!,"profileImageUrl":imageUrl])

            })
            
        }
    }
    
    @objc func cancelEvent() {
        self.dismiss(animated: true, completion: nil)
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
