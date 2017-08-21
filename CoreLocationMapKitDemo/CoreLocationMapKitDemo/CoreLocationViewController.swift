//
//  CoreLocationViewController.swift
//  CoreLocationMapKitDemo
//
//  Created by Sinh NX on 8/17/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class CoreLocationViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager:CLLocationManager = CLLocationManager()

    @IBOutlet weak var lblAddress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func getLocation(_ sender: Any) {
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
