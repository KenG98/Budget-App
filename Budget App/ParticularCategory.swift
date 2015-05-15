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
    
    func removeSpending(index: Int){
        spendings.removeAtIndex(index)
    }
    func getSpendingAt(index: Int) -> ParticularSpending {
        return spendings[index]
    }
    
    func removeSpending2(spending: ParticularSpending) {
        for var i = 0; i < spendings.count; i++ {
            if spending == spendings[i]{
                removeSpending(i)
            }
        }
    }
    func getSpendingSize() -> Int{
        return spendings.count
    }
    func addSpending(name: String, memo: String, date: NSDate, amount: Double){
        spendings.append(ParticularSpending(name: name, memo: memo, dateTime: date, amount: amount))
    }
    
    func addSpending(spending: ParticularSpending){
        spendings.append(spending)
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