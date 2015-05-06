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
    
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var periodPicker: UIPickerView!
    
    var options = ["Daily", "Weekly", "Monthly", "Yearly"]
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