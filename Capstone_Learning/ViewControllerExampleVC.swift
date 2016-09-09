//
//  ViewControllerExampleVC.swift
//  Capstone_Learning
//
//  Created by Tony Forsythe on 9/8/16.
//  Copyright © 2016 Tony Forsythe. All rights reserved.
//

import UIKit

class ViewControllerExampleVC : UIViewController
{
    
    @IBOutlet weak var testLabel: UILabel!
    
    var someName = "unknown"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.testLabel.text = self.someName
    }
    
}
