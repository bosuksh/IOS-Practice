//
//  Book.swift
//  Bookmanger
//
//  Created by 이상협 on 2018. 2. 27..
//  Copyright © 2018년 이상협. All rights reserved.
//

struct Book {
    var name: String
    var genre: String
    var author: String
    
    func bookPrint() {
        print("Name : \(name)")
        print("Genre : \(genre)")
        print("Author : \(author)")
        print("------------------")
    }
}
