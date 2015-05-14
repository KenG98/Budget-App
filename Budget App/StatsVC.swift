//
//  StatsVC.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import UIKit

class StatsVC: UIViewController, JBBarChartViewDelegate, JBBarChartViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barChartView = JBBarChartView();
        barChartView.dataSource = self;
        barChartView.delegate = self;
        barChartView.backgroundColor = UIColor.darkGrayColor();
        barChartView.frame = CGRectMake(0, 20, self.view.bounds.width, self.view.bounds.height * 0.5);
        barChartView.reloadData();
        self.view.addSubview(barChartView);
        println("Launched");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfBarsInBarChartView(barChartView: JBBarChartView!) -> UInt {
        println("numberOfBarsInBarChartView");
        return 10 //number of lines in chart
    }
    
    func barChartView(barChartView: JBBarChartView, heightForBarViewAtIndex index: UInt) -> CGFloat {
        println("barChartView", index);
        
        return CGFloat(arc4random_uniform(100));
    }
    
}