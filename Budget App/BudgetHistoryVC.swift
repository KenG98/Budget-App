//
//  BudgetHistoryVC.swift
//  Budget App
//
//  Created by Daniel Mizrahi on 5/13/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit
class BudgetHistoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var budgetTable: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var total = 0
        for var i = 0; i < theBudget.categories.count; i++ {
            total += theBudget.categories[i].getSpendingSize()
        }
        return total
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.budgetTable.dequeueReusableCellWithIdentifier("categorizedCell") as! UITableViewCell
        cell.textLabel?.text = theBudget.categories[indexPath.row].name
        cell.detailTextLabel?.text = "\(doubleToMoney(theBudget.categories[indexPath.row].moneySpent)) / \(doubleToMoney(theBudget.categories[indexPath.row].budget))"
        return cell
    }
}