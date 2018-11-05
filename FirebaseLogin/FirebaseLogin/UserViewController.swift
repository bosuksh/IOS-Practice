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

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image =  info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //print(image)
        let imageName = (Auth.auth().currentUser?.uid)!+"\(Int(NSDate.timeIntervalSinceReferenceDate*1000)).jpg"
        
        let data = image.jpegData(compressionQuality: 0.5)
        
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
            }
        }
        dismiss(animated: true, completion: nil)
    }
}
