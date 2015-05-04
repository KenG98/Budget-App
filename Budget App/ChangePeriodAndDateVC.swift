//
//  ChangePeriodAndDateVC.swift
//  Budget App
//
//  Created by Daniel Mizrahi on 5/2/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class ChangePeriodAndDateVC: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return theBudget.categories.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return theBudget.categories[row].name
    }
    
}