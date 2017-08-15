//
//  ViewController.swift
//  TouchEventDemo
//
//  Created by Sinh NX on 8/14/17.
//  Copyright © 2017 Sinh NX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblTouch: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgTransform = imgCover.transform
    
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapEvent)))
        self.view.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(pinchGuestureAction)))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pinchGuestureAction(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            imgCover.transform = imgCover.transform.scaledBy(x: sender.scale, y: sender.scale)
        } else if sender.state == .ended {
            imgCover.transform = imgTransform!
        }
    }
    private var imgTransform:CGAffineTransform?
    
    func tapEvent(_ sender: UITapGestureRecognizer) {
        tapCount += 1
    }
    private var tapCount:Int = 1
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lblTouch.text = "Tap Count: \(tapCount)"
        
        let t = touches.first
        t?.location(in: lblTouch)
        lblPosition.text = "x = \(t?.location(in: lblTouch).x ?? 0), y = \(t?.location(in: lblTouch).y ?? 0)"
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
        }
    }
}

