//
//  AddEditBookViewController.swift
//  TableViewControllerDemo
//
//  Created by Sinh NX on 8/7/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import UIKit

class AddEditBookViewController: UIViewController {
    @IBOutlet weak var txtISBN: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var bookNavigationItem: UINavigationItem!
    
    public var book:Book?
    public var isEditingBook: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(book != nil){
            txtISBN.text = book?.isbn
            txtTitle.text = book?.title
            txtAuthor.text = book?.author
            txtPrice.text = "\(book?.price ?? 0)"
            bookNavigationItem.title = "Edit Book"
        }else{
            bookNavigationItem.title = "Add Book"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addEditBook(_ sender: UIBarButtonItem) {
        if(book==nil){
            book = Book();
        }
        book?.isbn = txtISBN.text!
        book?.title = txtTitle.text!
        book?.author = txtAuthor.text!
        book?.price = Double(txtPrice.text!)!
        self.navigationController?.popViewController(animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
