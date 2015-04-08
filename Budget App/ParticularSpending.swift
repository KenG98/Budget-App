//
//  ParticularSpending.swift
//  Budget App
//
//  Created by Ken Garber on 4/8/15.
//  Copyright (c) 2015 Ken Garber. All rights reserved.
//

import Foundation

struct ParticularSpending {
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
}
