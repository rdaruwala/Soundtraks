//
//  Concert.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/25/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import Foundation


class Concert {
    
    var name:String!
    var concertDate:NSDate!
    var location:String!
    var shiftSchedule:[[String:String]]!
    var rawShiftText:String!
    
    init(name: String, date: NSDate, location: String){
        self.name = name
        self.concertDate = date
        self.location = location
        shiftSchedule = [["":""]]
        rawShiftText = ""
    }
    
    init(name: String, date: NSDate, location: String, schedule:[[String:String]]){
        self.name = name
        self.concertDate = date
        self.location = location
        shiftSchedule = schedule
        rawShiftText = ""
    }
}