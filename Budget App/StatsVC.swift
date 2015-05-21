//
//  StatsVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

/* 
How it works
-Line 0 (black) is how much the user has spent, cumulatively
-Line 1 (red) is the predicted amount the user will spend
-Line 2 (yellow) is the budget

The graph is divided into 
-100 parts for the user spending line
-2 parts for the prediction
-2 parts for the budget line
*/

import UIKit

class StatsVC: UIViewController, JBLineChartViewDelegate, JBLineChartViewDataSource {
    
    var graphValues: [Double] = []
    var predictedFinal: Double = 0
    var portionPassed: Double = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        graphValues = []
        var rawSpendings: [ParticularSpending] = theBudget.getAllSpendingsSorted()
        let periodInterval: Double = theBudget.periodLength/100
        portionPassed = theBudget.periodTimePassed/theBudget.periodLength
        
        func spentOnOrBefore(date: NSDate) -> Double{
            var totalSpent: Double = 0
            for spending in rawSpendings{
                if spending.dateTime.laterDate(date) == date {
                    totalSpent += spending.amount
                }
            }
            return totalSpent
        }
        
        //graphValues is initiated for entire class
        for i in 0..<100{
            graphValues.append(spentOnOrBefore(theBudget.periodStart.dateByAddingTimeInterval(NSTimeInterval(Double(i)*periodInterval))))
        }
        
        
        predictedFinal = graphValues.last! / portionPassed
        
        let lineChartView = JBLineChartView()
        lineChartView.dataSource = self
        lineChartView.delegate = self
        lineChartView.backgroundColor = UIColor.lightGrayColor()
        lineChartView.frame = CGRectMake(0, 20, self.view.bounds.width, self.view.bounds.height * 0.5)
        lineChartView.maximumValue *= 1.1
        lineChartView.reloadData()
        self.view.addSubview(lineChartView)
        println("Launched")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func lineChartView(lineChartView: JBLineChartView!, verticalValueForHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> CGFloat {
        if lineIndex == 0{
            if horizontalIndex <= UInt(ceil(100 * portionPassed)){
                return CGFloat(graphValues[Int(horizontalIndex)])
            }
            return CGFloat.NaN
        }
        if lineIndex == 1{
            if horizontalIndex == 0{
                return 0
            }
            else if Int(horizontalIndex) == graphValues.count - 1{
                return CGFloat(predictedFinal)
            }
            else{
                return CGFloat.NaN
            }
        }
        if lineIndex == 2{
            return CGFloat(theBudget.totalBudget)
        }

        return CGFloat(graphValues[Int(horizontalIndex)])
        
    }
    
    func numberOfLinesInLineChartView(lineChartView: JBLineChartView!) -> UInt {
        return 3
    }
    
    func lineChartView(lineChartView: JBLineChartView!, numberOfVerticalValuesAtLineIndex lineIndex: UInt) -> UInt {
        return UInt(graphValues.count)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, lineStyleForLineAtLineIndex lineIndex: UInt) -> JBLineChartViewLineStyle {
        if lineIndex == 1{
            return JBLineChartViewLineStyle.Dashed
        }
        return JBLineChartViewLineStyle.Solid
    }
    
    func lineChartView(lineChartView: JBLineChartView!, colorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if lineIndex == 0{
            return UIColor.blackColor()
        }
        if lineIndex == 1{
            return UIColor.redColor()
        }
        if lineIndex == 2{
            return UIColor.yellowColor()
        }
        return UIColor.whiteColor()
    }
}