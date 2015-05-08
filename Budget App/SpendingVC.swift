//
//  SpendingVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/12/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class SpendingVC: UIViewController{
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var spendingMemo: UITextView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var spendingDate: UILabel!
    
    var spending = ParticularSpending(name: "Loading...", memo: "Loading...", dateTime: NSDate(), amount: 0.0) //change this later
    var category = ParticularCategory(name: "Loading...", budget: 0)
    override func viewWillAppear(animated: Bool) {
        navBar.topItem?.title = spending.name
        amountLabel.text = doubleToMoney(spending.amount)
//        let calendar = NSCalendar.currentCalendar()
//        let date = spending.dateTime
//        let components = calendar.components(.CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitYear, fromDate: date)
//        spendingDate.text = "\(components.month)-\(components.day)-\(components.year)"
        spendingMemo.text = spending.memo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = spending.name
        amountLabel.text = doubleToMoney(spending.amount)
        let calendar = NSCalendar.currentCalendar()
        let date = spending.dateTime
        let components = calendar.components(.CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitYear, fromDate: date)
        spendingDate.text = "\(components.month)-\(components.day)-\(components.year)"
        spendingMemo.text = spending.memo
    }
    
    @IBAction func backPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditSpendingPressed"{
            if let destination = segue.destinationViewController as? EditSpendingVC{
                destination.spending = self.spending
                destination.category = self.category
            }
        }
    }
   }
