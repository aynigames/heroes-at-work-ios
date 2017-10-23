//
//  TimeInterval+Help.swift
//  Core
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    public var minutes:Int {
        let value = self/60
        return Int(value)
    }
    
    public var hours:Int {
        let value = self/3600
        return Int(value)
    }
    
    public var time:(hours:Int, minutes:Int, seconds:Int) {
        var interval = self
        let hours = self.hours
        interval = interval - Double(hours)*3600
        
        let minutes = interval.minutes
        interval = interval - Double(minutes)*60
   
        return (hours:hours, minutes:minutes, seconds:Int(interval))
    }

}
