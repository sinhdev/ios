//
//  FileHandlingViewController.swift
//  FileHandlingDemo
//
//  Created by Sinh NX on 8/21/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import UIKit

class FileHandlingViewController: UIViewController {

    @IBOutlet weak var textBox: UITextField!
    var fileMgn:FileManager = FileManager.default
    var docsDir:String?
    var dataFile:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dirPaths = fileMgn.urls(for: .documentDirectory, in: .userDomainMask)
        dataFile = dirPaths[0].appendingPathComponent("textFile.txt").path
        if fileMgn.fileExists(atPath: dataFile!){
            let databuffer = fileMgn.contents(atPath: dataFile!)
            let dataString = NSString(data: databuffer!, encoding: String.Encoding.utf8.rawValue)
            textBox.text = dataString! as String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveText(_ sender: UIButton) {
        let dataBuffer = textBox.text?.data(using: String.Encoding.utf8)
        if fileMgn.createFile(atPath: dataFile!, contents: dataBuffer, attributes: nil){
            let msg = UIAlertController(title: "Save file is completed!", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            msg.addAction(okAction)
            self.present(msg, animated: true, completion: nil)
        }
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
