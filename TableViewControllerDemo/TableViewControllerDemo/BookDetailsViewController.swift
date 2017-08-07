//
//  BookDetailsViewController.swift
//  TableViewControllerDemo
//
//  Created by Sinh NX on 8/7/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import UIKit

class BookDetailsViewController: UIViewController {
    public var book:Book?

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblISBN: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgCover: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if(book != nil){
            imgCover.image = UIImage.init(named: (book?.cover)!)!
            lblISBN.text = "ISBN: \(book?.isbn ?? "")"
            lblTitle.text = book?.title
            lblAuthor.text = "Author: \(book?.author ?? "")"
            lblPrice.text = "Price: \(book?.price ?? 0) USD"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
