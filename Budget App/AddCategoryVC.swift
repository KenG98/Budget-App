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
        var didWork = theBudget.addCategory(nameBox.text, budget: (amountBox.text as NSString).doubleValue)
        //IMPORTANT. Do error handling here. Check for proper input. Super unsafe as it is now.
        
        if didWork{
            dismissViewControllerAnimated(true, completion: nil)
            saveBudget()
        }
        else{
            let alert = UIAlertView()
            alert.title = "Sorry"
            alert.message = "A category with this name exists. Please choose a different name."
            alert.addButtonWithTitle("Okay")
            alert.show()
        }
        
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
