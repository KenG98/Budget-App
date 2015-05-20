//
//  StatsVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import UIKit

class StatsVC: UIViewController, JBLineChartViewDelegate, JBLineChartViewDataSource {
    
    var rawSpendings: [ParticularSpending] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rawSpendings = theBudget.getAllSpendingsSorted()
        
        let lineChartView = JBLineChartView()
        lineChartView.dataSource = self
        lineChartView.delegate = self
        lineChartView.backgroundColor = UIColor.whiteColor()
        lineChartView.frame = CGRectMake(0, 20, self.view.bounds.width, self.view.bounds.height * 0.5)
        lineChartView.reloadData()
        self.view.addSubview(lineChartView)
        println("Launched")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func lineChartView(lineChartView: JBLineChartView!, verticalValueForHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> CGFloat {
        return CGFloat(arc4random_uniform(100)) //CHANGE THIS
    }
    
    func numberOfLinesInLineChartView(lineChartView: JBLineChartView!) -> UInt {
        return 1 //CHANGE THIS
    }
    
    func lineChartView(lineChartView: JBLineChartView!, numberOfVerticalValuesAtLineIndex lineIndex: UInt) -> UInt {
        return 1 //MAYBE change this
    }
    
}