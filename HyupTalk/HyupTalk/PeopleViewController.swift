//
//  MainViewController.swift
//  HyupTalk
//
//  Created by 이상협 on 2018. 4. 6..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class PeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var array:[UserModel] = []
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView 추가 하드코딩
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableView.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView!)
        tableView.snp.makeConstraints {(m) in
            m.top.equalTo(view).offset(20)
            m.bottom.left.right.equalTo(view)
            
        }
        
        Database.database().reference().child("users").observe(DataEventType.value) { (snap) in
            
            //중복되는 데이터 삭제
            self.array.removeAll()
            
            
            //데이터를 하나씩 받아와 배열에 넣어준다.
            for child in snap.children {
                let fchild = child as! DataSnapshot
                let userModel = UserModel()
                
                userModel.setValuesForKeys(fchild.value as! [String : Any])
                self.array.append(userModel)
                
            }
            
            //테이블뷰 갱신해준다.
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let imageView = UIImageView()
        cell.addSubview(imageView)
        imageView.snp.makeConstraints({ (m) in
            m.centerY.equalTo(cell)
            m.left.equalTo(cell)
            m.height.width.equalTo(50)
        })
        
        
        URLSession.shared.dataTask(with: URL(string: array[indexPath.row].profileImageUrl!)!) { (data, response, err) in
            
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data!)
                imageView.layer.cornerRadius = imageView.frame.size.width/2
                imageView.clipsToBounds = true
                
            }
            }.resume()
        
        let label = UILabel()
        cell.addSubview(label)
        label.snp.makeConstraints { (m) in
            
            m.centerY.equalTo(cell)
            m.left.equalTo(imageView.snp.right).offset(30)
        }
        label.text = array[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
