//
//  SettingsVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class SettingsVC: UIViewController{
    
    @IBAction func testPressed(sender: AnyObject) {
//        var spendings = theBudget.getAllSpendingsSorted()
//        for spending in spendings{
//            println("\(spending.dateTime): \(spending.name)")
//        }
//        theBudget.periodPassed()
        
        
        // create testing data for graphing
        
        theBudget.periodStart = NSDate().dateByAddingTimeInterval(NSTimeInterval(-2629740/2)) //period starts two weeks ago
        theBudget.periodLength = NSTimeInterval(2629740) //1 month
        theBudget.categories = []
        theBudget.addCategory("test", budget: 8000)
        let someTime = 40320 //two weeks divided by 30, i want to get 3,000 dollars spent in 2 weeks (less than half of 8,000) - average 100 per purchase
        let testCategory = theBudget.categories[0]
        for i in 1...30{
            testCategory.addSpending("test", memo: "", date: theBudget.periodStart.dateByAddingTimeInterval(NSTimeInterval(i*someTime)), amount: Double(arc4random_uniform(250)))
        }
    }
    @IBAction func removeDataPressed(sender: UIButton) {
        var uiAlert = UIAlertController(title: "Wait", message: "This deletes all of your information permanently. Are you sure?", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(uiAlert, animated: true, completion: nil)
        uiAlert.addAction(UIAlertAction(title: "No", style: .Default, handler: { action in
            
        }))
        uiAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
            theBudget.categories = []
            saveBudget()
        }))

    }
    @IBAction func testHistoryPressed(sender: UIButton) {
        theBudget.periodPassed()
    }
}
