//
//  UserViewController.swift
//  
//
//  Created by 이상협 on 03/11/2018.
//

import UIKit
import Firebase

class UserViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            
        } catch {
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func profileUpload(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(imagePicker, animated:  true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
