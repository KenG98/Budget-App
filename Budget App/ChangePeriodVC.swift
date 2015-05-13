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
    func makePeriod(period: String) -> NSTimeInterval {
        switch period {
        case "1 Week" :
            return 604800
        case "1 Month" :
            return 2629740
        case "2 Months" :
            return 5259490
        case "3 Months" :
            return 7889230
        case "4 Months" :
            return 1051900
        case "6 Months" :
            return 15778500
        case "1 Year" :
            return 31556900
        default :
            return 0
            
        }
        
    }
    
    @IBAction func savePressed(sender: UIButton) {
        theBudget.periodStart = datePicker.date
        theBudget.periodLength = makePeriod(options[periodPicker.selectedRowInComponent(0)])
        //println(theBudget.periodLength)
        
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