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
    
    init(name: String){
        self.name = name
    }
    
    init(name: String, date: NSDate, location: String){
        self.name = name
        self.concertDate = date
        self.location = location
    }
}