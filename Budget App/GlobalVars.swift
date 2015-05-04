//
//  GlobalVars.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation

var theBudget = EntireBudget()

func saveBudget(){
    let budgetData = NSKeyedArchiver.archivedDataWithRootObject(theBudget)
    NSUserDefaults.standardUserDefaults().setObject(budgetData, forKey: "budgetData")
}

func loadBudget(){
    let budgetData = NSUserDefaults.standardUserDefaults().objectForKey("budgetData") as? NSData
    if (budgetData != nil){
        theBudget = NSKeyedUnarchiver.unarchiveObjectWithData(budgetData!) as! EntireBudget
    }
}

extension Double{
    var moneyString: NSString {
        return NSString(format: "%.2f", self)
    }
}