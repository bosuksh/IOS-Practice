//
//  main.swift
//  Bookmanger
//
//  Created by 이상협 on 2018. 2. 27..
//  Copyright © 2018년 이상협. All rights reserved.
//

import Foundation

var book1 = Book(name: "햄릿",genre: "비극", author: "셰익스피어")

//book1.bookPrint()
var book2 = Book(name: "누구를 위하여 종을 울리나",genre: "전쟁소설", author: "헤밍웨이")
//book2.bookPrint()
var book3 = Book(name: "죄와벌",genre: "사실주의", author: "톨스토이")
//book3.bookPrint()

var myBookManager = BookManager()

myBookManager.registerBook(bookObject: book1)
myBookManager.registerBook(bookObject: book2)
myBookManager.registerBook(bookObject: book3)

print(myBookManager.showAllBooks())
print("There are \(myBookManager.countBooks()) books")

//var searchResult = myBookManager.searchBook(name: "햄릿")
//
//if searchResult != nil {
//    print("찾으시는 책의 정보는 \n)
//    print(searchResult!)
//    print("입니다.\n")
//}
//else {
//    print("찾으시는 책이 없습니다\n")
//}

if let searchResult = myBookManager.searchBook(name: "울룰루") {
    print("\(searchResult)")
}
else {
    print("찾으시는 책이 없습니다.\n")
}

myBookManager.removeBook(name: "죄와벌")
print(myBookManager.showAllBooks())
print(myBookManager.countBooks())
