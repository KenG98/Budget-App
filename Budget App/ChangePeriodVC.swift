//
//  ChangePeriodVC.swift
//  Budget App
//
//  Created by Daniel Mizrahi on 5/6/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class ChangePeriodVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var periodPicker: UIPickerView!
    
    var options = ["1 Week", "1 Month", "2 Months", "3 Months", "4 Months", "6 Months", "1 Year"]
    
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func savePressed(sender: UIButton) {
        theBudget.periodStart = datePicker.date
        
        // do length here
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return options[row]
    }
}