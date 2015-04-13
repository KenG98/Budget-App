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
    
    var spending = ParticularSpending(name: "Loading...", memo: "Loading...", dateTime: NSDate(), amount: 0.0) //change this later

    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = spending.name
    }
    
    @IBAction func backPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}