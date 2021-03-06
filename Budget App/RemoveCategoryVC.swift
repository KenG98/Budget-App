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
    
    @IBAction func cancelClicked(sender: UIBarButtonItem) {
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
        
        var uiAlert = UIAlertController(title: "Wait", message: "Are you sure you want to delete this category? All spendings in the category will be erased, and it can't be undone.", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(uiAlert, animated: true, completion: nil)
        uiAlert.addAction(UIAlertAction(title: "No", style: .Default, handler: { action in
            
        }))
        uiAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
            theBudget.removeCategory(self.categoryPicker.selectedRowInComponent(0))
            self.dismissViewControllerAnimated(true, completion: nil)
            saveBudget()
        }))
        
        
        
    }
}