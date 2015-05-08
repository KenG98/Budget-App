//
//  CategoryVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class CategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var spendingsTable: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var category = ParticularCategory(name: "Loading...", budget: 0) //change this later
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = category.name
    }
    
    override func viewWillAppear(animated: Bool) {
        var path = spendingsTable.indexPathForSelectedRow()
        if let deselectPath = path {
            spendingsTable.deselectRowAtIndexPath(deselectPath, animated: true)
        }
        
        spendingsTable.reloadData()
    }
    
    @IBAction func backPressed(sender: UIBarButtonItem) {
        if spendingsTable.editing{
            let alert = UIAlertView()
            alert.title = "Wait!"
            alert.message = "Save your changes before going back."
            alert.addButtonWithTitle("Okay")
            alert.show()
        }else{
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func editPressed(sender: UIBarButtonItem) {
        if spendingsTable.editing{
            spendingsTable.setEditing(false, animated: true)
            editButton.title = "Edit"
        }else{
            spendingsTable.setEditing(true, animated: true)
            editButton.title = "Save Changes"
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if spendingsTable.editing{
            return UITableViewCellEditingStyle.Delete
        }else{
            return UITableViewCellEditingStyle.None
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        category.removeSpending(indexPath.row)
        spendingsTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        saveBudget()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.spendings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.spendingsTable.dequeueReusableCellWithIdentifier("spendingCell") as! UITableViewCell
        cell.textLabel?.text = category.spendings[indexPath.row].name
        cell.detailTextLabel?.text = doubleToMoney(category.spendings[indexPath.row].amount)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "spendingPressed"{
            if let destination = segue.destinationViewController as? SpendingVC{
                if let index = spendingsTable.indexPathForSelectedRow()?.row{
                    destination.spending = category.spendings[index]
                    destination.category = self.category
                }
            }
        }
    }
}