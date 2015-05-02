//
//  AddCategoryVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/29/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class AddCategoryVC: UIViewController {
    
    @IBOutlet weak var nameBox: UITextField!
    @IBOutlet weak var amountBox: UITextField!
    
    @IBAction func addCategoryPressed(sender: UIButton) {
        theBudget.addCategory(nameBox.text, budget: (amountBox.text as NSString).doubleValue)
        //IMPORTANT. Do error handling here. Check for proper input. Super unsafe as it is now.
        dismissViewControllerAnimated(true, completion: nil)
        saveBudget()
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}