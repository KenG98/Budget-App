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
    
    @IBAction func backPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theBudget.oldSpendings.count
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var path = budgetTable.indexPathForSelectedRow()
        if let deselectPath = path {
            budgetTable.deselectRowAtIndexPath(deselectPath, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.budgetTable.dequeueReusableCellWithIdentifier("historyCell") as! UITableViewCell
        cell.textLabel?.text = theBudget.oldSpendings[indexPath.row].name
        cell.detailTextLabel?.text = doubleToMoney(theBudget.oldSpendings[indexPath.row].amount)// this isn't working for some reason
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showOldSpendings"{
            if let destination = segue.destinationViewController as? ViewHistoricSpendingVC{
                if let index = budgetTable.indexPathForSelectedRow()?.row{
                    destination.spending = theBudget.oldSpendings[index]
                }
            }
        }
    }
    
}