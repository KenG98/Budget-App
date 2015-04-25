//
//  EntireBudget.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation

class EntireBudget: NSObject, NSCoding{
    var periodStart: NSDate
    var periodLength: NSTimeInterval
    var periodEnd: NSDate{
        get{
            return periodStart.dateByAddingTimeInterval(periodLength)
        }
    }
    var periodRemaining: NSTimeInterval{
        get{
            return periodEnd.timeIntervalSinceDate(NSDate())
        }
    }
    var categories: [ParticularCategory]
    var totalSpent: Double{
        get{
            var sum: Double = 0
            for category in categories{
                sum += category.moneySpent
            }
            return sum
        }
    }
    var totalBudget: Double{
        get{
            var sum: Double = 0
            for category in categories{
                sum += category.budget
            }
            return sum
        }
    }
    
    func addCategory(name: String, budget: Double) -> Bool{
        //checks if a category with this name already exists, if not it adds the category
        var success = true
        for cat in categories{
            if cat.name == name{
                success = false
            }
        }
        if success{
            categories.append(ParticularCategory(name: name, budget: budget))
        }
        return success
    }
    

    
    func printReport(){
        println("The current Budget: $\(totalSpent)/$\(totalBudget)\n")
        for category in categories{
            println("Category: \(category.name) - $\(category.moneySpent) spent of $\(category.budget)")
            for spending in category.spendings{
                println("\tSpending: \(spending.name) - $\(spending.amount)")
            }
        }
    }
    
    //COMMENT OUT
    func addSpending(categoryName: String, name: String, memo: String, date: NSDate, amount: Double){
        for cat in categories{
            if cat.name == categoryName{
                cat.addSpending(name, memo: memo, date: date, amount: amount)
            }
        }
    }
    //END COMMENT OUT
    
    override init(){
        categories = []
        
        periodStart = NSDate() //will change this later
        periodLength = NSTimeIntervalSince1970 //will change this later
        
        
        
        //load from saved file (or create an empty one if there isn't one now)
        
        //check if the period is over and its time to refresh the budget

        //test code below only
        
        //COMMENT OUT
        super.init()
        addCategory("Entertainment", budget: 3000)
        addSpending("Entertainment", name: "Movie", memo: "", date: NSDate(), amount: 9)
        addSpending("Entertainment", name: "Skydiving", memo: "", date: NSDate(), amount: 200)
        addSpending("Entertainment", name: "subway ticket", memo: "", date: NSDate(), amount: 5.65)
        addSpending("Entertainment", name: "theater", memo: "", date: NSDate(), amount: 40)
        addSpending("Entertainment", name: "that thing that time", memo: "", date: NSDate(), amount: 678)
        addCategory("Food", budget: 4000)
        addSpending("Food", name: "ice cream", memo: "", date: NSDate(), amount: 6)
        addSpending("Food", name: "chinese", memo: "", date: NSDate(), amount: 12)
        addSpending("Food", name: "sushi", memo: "", date: NSDate(), amount: 25)
        addSpending("Food", name: "pizza", memo: "", date: NSDate(), amount: 16)
        addSpending("Food", name: "burger", memo: "", date: NSDate(), amount: 8)
        addCategory("Rent", budget: 2000)
        addSpending("Rent", name: "my apartment", memo: "", date: NSDate(), amount: 900)
        addSpending("Rent", name: "utilities bill", memo: "", date: NSDate(), amount: 200)
        //END COMMENT OUT
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(categories, forKey: "categories")
        aCoder.encodeObject(periodStart, forKey: "periodStart")
        aCoder.encodeObject(periodLength, forKey: "periodLength")
    }
    
    required init(coder aDecoder: NSCoder) {
        self.categories = aDecoder.decodeObjectForKey("categories") as! [ParticularCategory]
        self.periodStart = aDecoder.decodeObjectForKey("periodStart") as! NSDate
        self.periodLength = aDecoder.decodeObjectForKey("periodLength") as! NSTimeInterval
    }

}