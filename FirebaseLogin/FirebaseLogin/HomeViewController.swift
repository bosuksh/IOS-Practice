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
        Database.database().reference().child("users").observeSingleEvent(of: .value) { (DataSnapshot) in
            
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
                
                self.array.append(userDTO)
                
            }
            self.collectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        
        cell.subject.text = array[indexPath.row].subject
        cell.explanation.text = array[indexPath.row].explanation
        
        let data = try? Data(contentsOf: URL(string: array[indexPath.row].imageUrl!)!)
        cell.imageView.image = UIImage(data: data!)
        
        return cell
    }

}

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var explanation: UILabel!
}
