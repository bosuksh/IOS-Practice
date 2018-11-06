//
//  UploadViewController.swift
//  FirebaseLogin
//
//  Created by 이상협 on 06/11/2018.
//  Copyright © 2018 이상협. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import Firebase


class UploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var explanation: UITextField!
    @IBAction func uploadButton(_ sender: Any) {
        
        let imageName = (Auth.auth().currentUser?.uid)!+"\(Int(NSDate.timeIntervalSinceReferenceDate*1000)).jpg"
        
        let image = imageView.image
        let data = image!.jpegData(compressionQuality: 0.5)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        
        let riversRef = Storage.storage().reference().child("ios_images").child(imageName)
        
        riversRef.putData(data!, metadata: metadata) { (metadata, err) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                print(err?.localizedDescription)
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            
            riversRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
                Database.database().reference().child("users").setValue([
                    "userID": Auth.auth().currentUser?.email,
                    "uid": Auth.auth().currentUser?.uid,
                    "subject": self.name.text!,
                    "explanation": self.explanation.text!,
                    "imageURL": downloadURL.absoluteString,
                    ])
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func imageSelect() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(imagePicker, animated:  true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageSelect)))
        imageView.isUserInteractionEnabled = true

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

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image =  info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //print(image)
        self.imageView.image = image
        dismiss(animated: true, completion: nil)
    }
}
