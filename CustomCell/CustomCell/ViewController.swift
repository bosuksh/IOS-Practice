//
//  ViewController.swift
//  CustomCell
//
//  Created by 이상협 on 2018. 3. 13..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    
    var itemList = [[String:String]]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = ["name":"사과","image":"apple.jpeg","amount":"6","value":"3000"]
        let item2 = ["name":"블루베리","image":"blueberry.jpg","amount":"3","value":"2000"]
        let item3 = ["name":"당근","image":"carrot.jpg","amount":"6","value":"3000"]
        let item4 = ["name":"체리","image":"cherry.png","amount":"2","value":"1000"]
        let item5 = ["name":"포도","image":"grape.jpg","amount":"8","value":"3000"]
        let item6 = ["name":"키위","image":"kiwi.png","amount":"3","value":"5000"]
        let item7 = ["name":"레몬","image":"lemon.png","amount":"16","value":"13000"]
        let item8 = ["name":"라임","image":"lime.jpg","amount":"5","value":"4000"]
        let item9 = ["name":"고기","image":"meat.jpg","amount":"20","value":"32000"]
        let item10 = ["name":"딸기","image":"strawberry.jpg","amount":"16","value":"3500"]
        let item11 = ["name":"토마토","image":"tomato.png","amount":"9","value":"1000"]
        let item12 = ["name":"채소","image":"vegetable.jpg","amount":"5","value":"1500"]
        let item13 = ["name":"수박","image":"watermelon.png","amount":"6","value":"23000"]
        
        itemList = [item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item1,item12,item13]
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let dicTemp =  itemList[indexPath.row]
        
        cell.AmountLabel.text = dicTemp["amount"]
        cell.NameLabel.text = dicTemp["name"]
        cell.ValueLabel.text = dicTemp["value"]
        
        cell.ImgView.image = UIImage(named:dicTemp["image"]!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            (segue.destination as! DetailViewController).detailData = itemList[tableView.indexPathForSelectedRow!.row]
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

