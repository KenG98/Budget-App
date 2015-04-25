//
//  ParticularCategory.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation

class ParticularCategory: NSObject, NSCoding{
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
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(spendings, forKey: "spendings")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(budget, forKey: "budget")
    }
    
    required init(coder aDecoder: NSCoder) {
        self.spendings = aDecoder.decodeObjectForKey("spendings") as! [ParticularSpending]
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.budget = aDecoder.decodeObjectForKey("budget") as! Double
    }
    
}