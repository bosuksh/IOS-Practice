//
//  HomeViewController.swift
//  FirebaseLogin
//
//  Created by 이상협 on 03/11/2018.
//  Copyright © 2018 이상협. All rights reserved.
//

import UIKit
import Firebase


class HomeViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var array: [UserDTO] = []
    var uidKey: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Database.database().reference().child("users").observe(.value) { (DataSnapshot) in
            self.uidKey.removeAll()
            self.array.removeAll()
            for child in DataSnapshot.children {
                let fchild = child as! DataSnapshot
                let value = fchild.value as! NSDictionary
                let userDTO = UserDTO()
                userDTO.explanation = value["explanation"] as! String
                userDTO.imageUrl = value["imageURL"] as! String
                userDTO.subject = value["subject"] as! String
                userDTO.uid = value["uid"] as! String
                userDTO.userID = value["userID"] as! String
                userDTO.imageName = value["imageName"] as! String
                let uidkey = fchild.key as! String
                
                if let stars = value["stars"] {
                    userDTO.stars = stars as! [String : Bool]
                }
                if let starCount = value["starCount"] {
                    userDTO.starCount = starCount as! NSNumber
                }
                self.array.append(userDTO)
                self.uidKey.append(uidkey)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func like(_ sender: UIButton) {
        
    Database.database().reference().child("users").child(self.uidKey[sender.tag]).runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
        if var post = currentData.value as? [String : AnyObject], let uid = Auth.auth().currentUser?.uid {
            var stars: Dictionary<String, Bool>
            stars = post["stars"] as? [String : Bool] ?? [:]
            var starCount = post["starCount"] as? Int ?? 0
            if let _ = stars[uid] {
                // Unstar the post and remove self from stars
                starCount -= 1
                stars.removeValue(forKey: uid)
            } else {
                // Star the post and add self to stars
                starCount += 1
                stars[uid] = true
            }
            post["starCount"] = starCount as AnyObject?
            post["stars"] = stars as AnyObject?
            
            // Set value and report transaction success
            currentData.value = post
            
            return TransactionResult.success(withValue: currentData)
        }
            return TransactionResult.success(withValue: currentData)
        }) { (error, committed, snapshot) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    @objc func deleteImage(_ sender: UIButton) {
        let desertRef = Storage.storage().reference().child("ios_images").child(self.array[sender.tag].imageName!)
        let ref = Database.database().reference().child("users")
        // Delete the file
        desertRef.delete { error in
            if let error = error {
                print("삭제 에러")
                // Uh-oh, an error occurred!
            } else {
                // File deleted successfully
                ref.child(self.uidKey[sender.tag]).removeValue()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        
        cell.subject.text = array[indexPath.row].subject
        cell.explanation.text = array[indexPath.row].explanation
        
        URLSession.shared.dataTask(with: URL(string: array[indexPath.row].imageUrl!)!) {
            (data, response, err) in
            if err != nil {
                return
            }
            
            DispatchQueue.main.async {
               cell.imageView.image = UIImage(data: data!)
            }
        }.resume()
        
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(like(_:)), for: .touchUpInside)
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteImage(_:)), for: .touchUpInside)
        
        if let _ = self.array[indexPath.row].stars?[(Auth.auth().currentUser?.uid)!] {
            cell.starButton.setImage(#imageLiteral(resourceName: "baseline_favorite_black_24pt"), for: .normal)
        }else {
            cell.starButton.setImage(#imageLiteral(resourceName: "baseline_favorite_border_black_24pt"), for: .normal)
        }
        
        return cell
    }

}

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var explanation: UILabel!
    @IBOutlet weak var starButton: UIButton!
}
