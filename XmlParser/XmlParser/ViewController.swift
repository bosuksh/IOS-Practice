//
//  ViewController.swift
//  XmlParser
//
//  Created by 이상협 on 2018. 3. 15..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, XMLParserDelegate{
    @IBOutlet weak var mainTableView: UITableView!
    
    struct Weather:Decodable {
        let country:String
        let weather:String
        let temperature:String
    }
    var dataList = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let jsonURLString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/swift4weather.json"
        
        guard let jsonURL = URL(string: jsonURLString) else { return }
        URLSession.shared.dataTask(with: jsonURL, completionHandler: {(data,response,error) -> Void in
            guard let data = data else { return }
            
            do {
                self.dataList = try JSONDecoder().decode([Weather].self, from: data)
               // print
                DispatchQueue.main.async(execute: {
                    self.mainTableView.reloadData()
                })
            }
            catch {
                print("Parsing Error! \(error)")
            }
        }).resume() // URL Session후 resume을 빼먹으면 안된다.
        
        /*비동기라 테이블뷰가 보여지기 전에 다운로드를 받지 못한다. 따라서 테이블뷰를 리로드 해줘야한다.*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* table View에서 각각의 cell에게 적용시켜준다. 그 cell의 이름을 "Cell" 이라고 정했다.*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        
        let structTemp = dataList[indexPath.row]   // 각 cell의 row를 받아올때는 indexPath.row를 이용한다.
        let weatherStr = structTemp.weather
        
        cell.countryLabel.text = structTemp.country
        cell.weatherLabel.text = structTemp.weather
        cell.temperatureLabel.text =
            "\(structTemp.temperature)'C"
        
        if weatherStr == "맑음" {
            cell.ImgView.image = UIImage(named: "sunny.png")
        }
        else if weatherStr == "흐림" {
            cell.ImgView.image = UIImage(named: "cloudy.png")
        }
        else if weatherStr == "비" {
            cell.ImgView.image = UIImage(named: "rainy.png")
        }
        else if weatherStr == "눈" {
            cell.ImgView.image = UIImage(named: "snow.png")
        }
        else {
            cell.ImgView.image = UIImage(named: "blizzard.png")
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

