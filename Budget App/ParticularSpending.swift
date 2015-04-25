//
//  ParticularSpending.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation

class ParticularSpending: NSObject, NSCoding {
    var amount: Double
    var dateTime: NSDate
    var memo: String
    var name: String
    
    init(name: String, memo: String, dateTime: NSDate, amount: Double){
        self.amount = amount
        self.dateTime = dateTime
        self.memo = memo
        self.name = name
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(memo, forKey: "memo")
        aCoder.encodeObject(dateTime, forKey: "dateTime")
        aCoder.encodeObject(amount, forKey: "amount")
    }
    
    required init(coder aDecoder: NSCoder) {
        self.amount = aDecoder.decodeObjectForKey("amount") as! Double
        self.dateTime = aDecoder.decodeObjectForKey("dateTime") as! NSDate
        self.memo = aDecoder.decodeObjectForKey("memo") as! String
        self.name = aDecoder.decodeObjectForKey("name") as! String
    }
}
