//
//  ViewController.swift
//  VisualBookManager
//
//  Created by 이상협 on 2018. 2. 27..
//  Copyright © 2018년 이상협. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myBookManager = BookManager()
    
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let book1 = Book(name: "햄릿",genre: "비극", author: "셰익스피어")
        let book2 = Book(name: "누구를 위하여 종을 울리나",genre: "전쟁소설", author: "헤밍웨이")
        let book3 = Book(name: "죄와벌",genre: "사실주의", author: "톨스토이")
        
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        countLabel.text = "\(myBookManager.countBooks())"
    }

    @IBAction func registerBookAction( _sender: Any) {
        var bookTemp = Book()
        
        if nameTextField.text != "" {
        bookTemp.name = nameTextField.text!
        bookTemp.genre = genreTextField.text!
        bookTemp.author = authorTextField.text!
        
        myBookManager.registerBook(bookObject: bookTemp)
        countLabel.text = "\(myBookManager.countBooks())"
        outputTextView.text = "\(nameTextField.text!) has been registered"
        }
        else {
            outputTextView.text = "Nothing is registered."
        }
    }
    
    @IBAction func showAllBookAction( _sender: Any) {
//        print(myBookManager.showAllBooks())
        outputTextView.text = myBookManager.showAllBooks()
    }
    
    @IBAction func searchBooksAction(_ sender: Any) {
        let resultBook = myBookManager.searchBook(name: nameTextField.text!)
        if resultBook != nil {
            outputTextView.text = resultBook
        }
        else {
            outputTextView.text = "We don't have that book."
        }
    }
    
    @IBAction func removeAction(_ sender: Any) {
        
        if nameTextField.text != "" {
        outputTextView.text = "\(nameTextField.text!) is removed"
        myBookManager.removeBook(name: nameTextField.text!)
        countLabel.text = "\(myBookManager.countBooks())"
        }
        else {
            outputTextView.text = "Nothing removed."
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

