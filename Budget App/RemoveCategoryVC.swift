//
//  RemoveCategoryVC.swift
//  Budget App
//
//  Created by Daniel Mizrahi on 5/1/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit
class RemoveCategoryVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBAction func cancelClicked(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func numberOfComponentsInPickerView(pickerView:     UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return theBudget.categories.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return theBudget.categories[row].name
    }
    @IBAction func deleteClicked(sender: UIButton) {
        theBudget.removeCategory(categoryPicker.selectedRowInComponent(0))
        dismissViewControllerAnimated(true, completion: nil) //Not sure yet if I want this but I'll leave it in for now
        saveBudget()
    }
}