//
//  HowToUseVC.swift
//  Budget App
//
//  Created by Daniel Mizrahi on 5/2/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class HowToUseVC: UIViewController{
    
    @IBAction func doneClicked(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}