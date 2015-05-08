//
//  EditSpendingVC.swift
//  Budget App
//
//  Created by Daniel Mizrahi on 5/4/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class EditSpendingVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var memoBox: UITextView!
    @IBOutlet weak var nameBox: UITextField!
    @IBOutlet weak var amountBox: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var spending = ParticularSpending(name: "Loading...", memo: "Loading...", dateTime: NSDate(), amount: 0.0) //change this later
    var category = ParticularCategory(name: "Loading...", budget: 0)
    
    var categoryIndex = 0
    var spendingIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBox.text = "\(spending.amount)"
        memoBox.text = spending.memo
        nameBox.text = spending.name
        
        for var i = 0; i < theBudget.categories.count; i++ {
            if theBudget.categories[i] === category {
                categoryIndex = i
            }
        }
        //for var i = 0; i < theBudget.categories[i].
        categoryPicker.selectRow(categoryIndex, inComponent: 0, animated: true)
    }
    @IBAction func cancelPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func savePressed(sender: UIButton) {
        let memo = memoBox.text
        let name = nameBox.text
        let amount =  (amountBox.text as NSString).doubleValue
        spending.update(name, memo: memo, amount: amount)
        dismissViewControllerAnimated(true, completion: nil)
        theBudget.categories[categoryIndex].removeSpending2(spending)
        let index = categoryPicker.selectedRowInComponent(0)
        theBudget.categories[index].addSpending(spending)
        saveBudget()
        
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