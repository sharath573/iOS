//
//  ViewController.swift
//  LandHoriz
//
//  Created by Sharath on 10/4/18.
//  Copyright © 2018 Sharath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceName=UIDevice.current.model
        if(deviceName=="iPad"){
            label5.backgroundColor=UIColor.red
            label6.backgroundColor=UIColor.red
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


