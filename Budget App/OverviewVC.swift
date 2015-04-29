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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        totalLabel.text = "Total: $\(theBudget.totalSpent) / $\(theBudget.totalBudget)"
        var path = categoryTableView.indexPathForSelectedRow()
        if let deselectPath = path {
           categoryTableView.deselectRowAtIndexPath(deselectPath, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theBudget.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.categoryTableView.dequeueReusableCellWithIdentifier("categorizedCell") as! UITableViewCell
        cell.textLabel?.text = theBudget.categories[indexPath.row].name
        cell.detailTextLabel?.text = "$\(theBudget.categories[indexPath.row].moneySpent) / $\(theBudget.categories[indexPath.row].budget)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "categoryPressed"{
            if let destination = segue.destinationViewController as? CategoryVC{
                if let index = categoryTableView.indexPathForSelectedRow()?.row{
                    destination.category = theBudget.categories[index]
                }
            }
        }
    }
}