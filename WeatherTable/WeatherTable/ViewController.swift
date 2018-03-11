//
//  ViewController.swift
//  WeatherTable
//
//  Created by 이상협 on 2018. 3. 11..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    var dataList = [[String : String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dic1 = ["지역":"한국","날씨":"맑음"]
        let dic2 = ["지역":"미국", "날씨":"흐림"]
        let dic3 = ["지역":"일본", "날씨":"비"]
        let dic4 = ["지역":"중국", "날씨":"눈"]
        let dic5 = ["지역":"태국", "날씨":"우박"]
        let dic6 = ["지역":"프랑스", "날씨":"맑음"]
        let dic7 = ["지역":"독일", "날씨":"흐림"]
        let dic8 = ["지역":"벨기에", "날씨":"비"]
        let dic9 = ["지역":"영국", "날씨":"눈"]
        let dic10 = ["지역":"스페인", "날씨":"우박"]
        let dic11 = ["지역":"호주", "날씨":"맑음"]
        let dic12 = ["지역":"말레이시아", "날씨":"흐림"]
        let dic13 = ["지역":"스위스", "날씨":"비"]
        let dic14 = ["지역":"러시아", "날씨":"눈"]
        let dic15 = ["지역":"브라질", "날씨":"우박"]
        let dic16 = ["지역":"멕시코", "날씨":"맑음"]
        let dic17 = ["지역":"캐나다", "날씨":"흐림"]
        let dic18 = ["지역":"북한", "날씨":"비"]
        let dic19 = ["지역":"필리핀", "날씨":"눈"]
        
        dataList = [dic1, dic2, dic3, dic4, dic5, dic6, dic7, dic8, dic9, dic10, dic11, dic12, dic13, dic14, dic15, dic16, dic17, dic18, dic19]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var dicTemp = dataList[indexPath.row]
        
//        print("idexPath.row = \(indexPath.row)")
//        print("dicTemp = \(dicTemp["날씨"]!)")
        
        cell.textLabel!.text = dicTemp["지역"]
        
        let weather = dicTemp["날씨"]
        //print("weather = \(weather!)")
        
        cell.detailTextLabel!.text = weather
        
        if weather == "맑음" {
            cell.imageView!.image = UIImage(named: "sunny.png")
        }
        else if weather == "비" {
            cell.imageView!.image = UIImage(named: "rainy.png")
        }
        else if weather == "눈" {
            cell.imageView!.image = UIImage(named: "snow.png")
        }
        else if weather == "흐림" {
            cell.imageView!.image = UIImage(named: "cloudy.png")
        }
        else {
            cell.imageView!.image = UIImage(named: "blizzard.png")
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

