//
//  OverviewVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation
import UIKit

class OverviewVC: UIViewController{
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        totalLabel.text = "Total: $\(theBudget.totalSpent) / $\(theBudget.totalBudget)"
    }
}