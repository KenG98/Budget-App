//
//  SpendVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class SpendVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var nameBox: UITextField!
    @IBOutlet weak var amountBox: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!

    @IBAction func spendPressed(sender: UIButton) {
        var purchaseName = nameBox.text
        if purchaseName == "" {
            purchaseName = "Default"
        }
        if amountBox.text == "" {
            let alert = UIAlertView()
            alert.title = "Spend"
            alert.message = "Invalid entry. Must enter amount."
            alert.addButtonWithTitle("Okay")
            alert.show()
        }else{
            theBudget.categories[categoryPicker.selectedRowInComponent(0)].addSpending(purchaseName, memo: " ", date: NSDate(), amount: (amountBox.text as NSString).doubleValue) //add memo later
        }
        
    }
    
    @IBAction func backPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return theBudget.categories.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return theBudget.categories[row].name
    }
}