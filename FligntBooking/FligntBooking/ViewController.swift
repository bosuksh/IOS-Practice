//
//  ViewController.swift
//  FligntBooking
//
//  Created by 이상협 on 2018. 3. 4..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var DepartureDateButton: UIButton!
    @IBOutlet weak var ReturnDateButton: UIButton!
    @IBOutlet weak var ReturnDateLabel: UILabel!
    @IBOutlet weak var DatePickerView: UIDatePicker!
    var buttonTag:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReturnDateLabel.isHidden = true
        DatePickerView.isHidden = true
        ReturnDateButton.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func showDatePickerAction(_ sender: UIButton) {
       // print(sender.description)
        
        
        if DatePickerView.isHidden == false {
            DatePickerView.isHidden = true
        }
        else {
            DatePickerView.isHidden = false
        }
        buttonTag = sender.tag
        
    }
    @IBAction func showReturnDateShowAction(_ sender: UISwitch) {
        //print(sender.description)
//        if sender.isOn {
//            ReturnDateButton.isHidden = true
//            ReturnDateLabel.isHidden = true
//        }
//        else {
//            ReturnDateButton.isHidden = false
//            ReturnDateLabel.isHidden = false
//        }
        
        ReturnDateButton.isHidden = !sender.isOn
        ReturnDateLabel.isHidden = !sender.isOn
    }
    @IBAction func SelectedDateAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        
        let dateString = formatter.string(from: sender.date)
        
        if buttonTag == 1{
        DepartureDateButton.setTitle(dateString, for: UIControlState.normal)
        }
        else if buttonTag == 2 {
            ReturnDateButton.setTitle(dateString, for: UIControlState.normal)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        DatePickerView.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

