//
//  BooksTableViewController.swift
//  TableViewControllerDemo
//
//  Created by Sinh NX on 8/7/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import UIKit

class BooksTableViewController: UITableViewController {
    private var lstBooks:[Book] = []
    private var bookDetails:Book?
    private var aeBookVC:AddEditBookViewController?

    @IBOutlet var bookTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        lstBooks += [Book(isbn: "12345", cover: "book_cover", title: "Swift Programming Language 2", author: "Apple Inc.", price: 120), Book(isbn: "12346", cover: "book_cover", title: "Swift Programming Language 3", author: "Apple Inc.", price: 120), Book(isbn: "12347", cover: "book_cover", title: "Swift Programming Language 4", author: "Apple Inc.", price: 120)]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(aeBookVC != nil && !(aeBookVC?.isEditingBook)! && aeBookVC?.book != nil){
            lstBooks.append((aeBookVC?.book)!)
            aeBookVC = nil
        }
        bookTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? ""){
            case "sgAddBook":
                aeBookVC = segue.destination as? AddEditBookViewController
                aeBookVC?.isEditingBook = false
            case "sgViewDetails":
                let viewDetails = segue.destination as? BookDetailsViewController
                viewDetails?.book = lstBooks[(bookTableView.indexPathForSelectedRow?.row)!]
            default:
                print("no segue selection...")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lstBooks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "bookTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BookTableViewCell
        cell.book = lstBooks[indexPath.row]
        // Configure the cell...
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let indexSelected = bookTableView.indexPathForSelectedRow!
//        bookDetails = lstBooks[indexPath.row]
//        performSegue(withIdentifier: "sgViewDetails", sender: self)
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lstBooks.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
