//
//  OverviewVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class OverviewVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    
    @IBOutlet weak var spendButton: UIButton!
    @IBOutlet weak var goToCategoriesLabel: UILabel!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        totalLabel.text = "Total: \(doubleToMoney(theBudget.totalSpent)) / \(doubleToMoney(theBudget.totalBudget))"
        var path = categoryTableView.indexPathForSelectedRow()
        if let deselectPath = path {
           categoryTableView.deselectRowAtIndexPath(deselectPath, animated: true)
        }
        if theBudget.categories.count == 0 {
            spendButton.hidden = true
        } else {
            spendButton.hidden = false
        }
        categoryTableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if theBudget.categories.count != 0 {
            return theBudget.categories.count
        }
            return 1
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if theBudget.categories.count != 0{
            var cell:UITableViewCell = self.categoryTableView.dequeueReusableCellWithIdentifier("categorizedCell") as! UITableViewCell
            cell.textLabel?.text = theBudget.categories[indexPath.row].name
            cell.detailTextLabel?.text = "\(doubleToMoney(theBudget.categories[indexPath.row].moneySpent)) / \(doubleToMoney(theBudget.categories[indexPath.row].budget))"
            return cell
        }
        else {
            var cell:UITableViewCell = self.categoryTableView.dequeueReusableCellWithIdentifier("addCategory") as! UITableViewCell
            cell.textLabel?.text = "Go to settings to add categories"
            cell.detailTextLabel?.text = " "
            
            return cell
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "categoryPressed" {
            if let destination = segue.destinationViewController as? CategoryVC{
                if let index = categoryTableView.indexPathForSelectedRow()?.row{
                    destination.category = theBudget.categories[index]
                }
            }
        }
        
    }
}