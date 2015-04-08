//
//  ParticularCategory.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation

class ParticularCategory {
    var spendings: [ParticularSpending]
    var name: String
    var budget: Double
    
    var moneySpent: Double{
        get{
            var sum: Double = 0
            for spending in spendings{
                sum += spending.amount
            }
            return sum
        }
    }
    
    func addSpending(name: String, memo: String, date: NSDate, amount: Double){
        spendings.append(ParticularSpending(name: name, memo: memo, dateTime: date, amount: amount))
    }
    
    init(name: String, budget: Double){
        self.name = name
        self.budget = budget
        spendings = []
    }
    
}