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
    
    var category = ParticularCategory(name: "Loading...", budget: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = category.name
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.spendings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.spendingsTable.dequeueReusableCellWithIdentifier("spendingCell") as UITableViewCell
        cell.textLabel?.text = category.spendings[indexPath.row].name
        cell.detailTextLabel?.text = "$\(category.spendings[indexPath.row].amount)"
        return cell
    }
}