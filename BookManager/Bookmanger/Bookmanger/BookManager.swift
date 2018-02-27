//
//  BookManager.swift
//  Bookmanger
//
//  Created by 이상협 on 2018. 2. 27..
//  Copyright © 2018년 이상협. All rights reserved.
//

import Foundation

class BookManager{
    var bookList = [Book]()
    
    func registerBook (bookObject:Book) {
        bookList += [bookObject]
    }
    
    func showAllBooks() -> String {
        var strTemp = ""
        for bookTemp in bookList {
            strTemp += "Name : \(bookTemp.name)\n"
            strTemp += "Genre : \(bookTemp.genre)\n"
            strTemp += "Author : \(bookTemp.author)\n"
            strTemp += "----------------------------\n"

        }
        return strTemp
    }
    
    func countBooks() -> Int {
        return bookList.count
    }
    
    func searchBook(name:String) -> String? {
        var strTemp = ""
        for bookTemp in bookList {
            if name == bookTemp.name {
                strTemp += "Name : \(bookTemp.name)\n"
                strTemp += "Genre : \(bookTemp.genre)\n"
                strTemp += "Author : \(bookTemp.author)\n"
                strTemp += "----------------------------\n"
                
                return strTemp
            }
        }
        return nil
    }
    func removeBook(name:String) {
        
        for (index, value) in bookList.enumerated() {
            if name == value.name {
                bookList.remove(at: index)
            }
        }
    }
    
}
