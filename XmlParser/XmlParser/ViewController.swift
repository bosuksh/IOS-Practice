//
//  ViewController.swift
//  XmlParser
//
//  Created by 이상협 on 2018. 3. 15..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, XMLParserDelegate{
    
    var dataList = [[String:String]]()
    var detailData = [String:String]()
    var elementTemp: String = ""
    var blank: Bool = false     //parser가 닫는 태그 뒤에 있는 blank도 string에 넣기 때문에 flag를 이용해서 처리해준다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        /*url을 가져올때는 URL이라는 메소드를 사용해서 가져오면 된다.*/
        guard let baseUrl = URL(string: urlString) else {
            print("Url error")
            return
        }
        // parsing은 XMLParser라는 메소드를 이용한다.
        guard let parser = XMLParser(contentsOf: baseUrl) else {
            print("Can not read data")
            return
        }
        
        
        parser.delegate = self
        if !parser.parse() {
            print("Parse failure")
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        elementTemp = elementName
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if blank == true && elementTemp != "local" && elementTemp != "weatherinfo" {
            detailData[elementTemp] = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "local" {
            dataList += [detailData]
        }
        blank = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* table View에서 각각의 cell에게 적용시켜준다. 그 cell의 이름을 "Cell" 이라고 정했다.*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        
        var dicTemp = dataList[indexPath.row]   // 각 cell의 row를 받아올때는 indexPath.row를 이용한다.
        let weatherStr = dicTemp["weather"]
        
        cell.countryLabel.text = dicTemp["country"]
        cell.weatherLabel.text = dicTemp["weather"]
        cell.temperatureLabel.text =
            "\(dicTemp["temperature"]!)'C"
        
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

