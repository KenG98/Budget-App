//
//  SettingsVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class SettingsVC: UIViewController{
    
    @IBAction func testPressed(sender: AnyObject) {
        var spendings = theBudget.getAllSpendingsSorted()
        for spending in spendings{
            println("\(spending.dateTime): \(spending.name)")
        }
    }
}
