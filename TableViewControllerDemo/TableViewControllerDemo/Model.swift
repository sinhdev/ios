//
//  Model.swift
//  TableViewControllerDemo
//
//  Created by Sinh NX on 8/5/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import Foundation

public class Book{
    var isbn:String = ""
    var cover:String = "book_cover"
    var title:String = ""
    var author:String = ""
    var price:Double = 0
    
    init(){
        isbn = ""
        cover = "book_cover"
        title = ""
        author = ""
        price = 0
    }
    
    init(isbn:String, cover:String, title:String,author:String, price:Double){
        self.isbn = isbn
        self.cover = cover
        self.title = title
        self.author = author
        self.price = price
    }
}
