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
    @IBOutlet weak var memoBox: UITextView!

    @IBAction func spendPressed(sender: UIButton) {
        var purchaseName = nameBox.text
        if purchaseName == "" {
            purchaseName = "Default Name"
        }
        if amountBox.text == "" {
            let alert = UIAlertView()
            alert.title = "Spend"
            alert.message = "Invalid entry. Must enter amount."
            alert.addButtonWithTitle("Okay")
            alert.show()
        }else{
            theBudget.categories[categoryPicker.selectedRowInComponent(0)].addSpending(purchaseName, memo: memoBox.text, date: NSDate(), amount: (amountBox.text as NSString).doubleValue) //add memo later
            dismissViewControllerAnimated(true, completion: nil)
            saveBudget()
        }
    }
    
    @IBAction func backPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBAction func backgroundTap(sender: UITapGestureRecognizer) {
        amountBox.resignFirstResponder()
        nameBox.resignFirstResponder()
        memoBox.resignFirstResponder()
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return theBudget.categories.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return theBudget.categories[row].name
    }
}