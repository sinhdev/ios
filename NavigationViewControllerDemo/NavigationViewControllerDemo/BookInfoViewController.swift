//
//  ViewController.swift
//  NavigationViewControllerDemo
//
//  Created by Sinh NX on 8/3/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import UIKit

class BookInfoViewController: UIViewController {
    @IBOutlet weak var lblISBN: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var editButton: UIBarButtonItem!
    private var book:Book = Book();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        book.isbn = "1234567899"
        book.title = "iOS Apps Development with Swift"
        book.author = "VTC Academy"
        book.price = 12.5
        
        showBook();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func showBook()->Void{
        lblISBN.text = book.isbn
        lblTitle.text = book.title
        lblAuthor.text = book.author
        lblPrice.text = "\(book.price) USD";
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showBook()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if((sender as! UIBarButtonItem) == editButton){
            let editView = segue.destination as! EditBookViewController
            editView.book = book
        }
        
        /*
         switch (segue.identifier ?? "") {
         case "editBook":
         let editView = segue.destination as! UpdateViewController
         editView.book = book
         default:
         print("default")
         }
         */
    }
}

