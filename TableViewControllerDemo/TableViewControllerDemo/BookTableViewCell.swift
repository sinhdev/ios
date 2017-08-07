//
//  BookTableViewCell.swift
//  TableViewControllerDemo
//
//  Created by Sinh NX on 8/7/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    public var book:Book?

    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        if(book != nil){
            let img:UIImage = UIImage.init(named: (book?.cover)!)!
            imgCover.image = img
            lblTitle.text = book?.title
            lblTitle.lineBreakMode = .byWordWrapping
            lblTitle.numberOfLines = 0
            lblAuthor.text = book?.author
            lblPrice.text = "\(book?.price ?? 0)"
        }
    }

}
