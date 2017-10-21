//
//  NSDate+JavascriptTimestamp.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 5/8/16.
//  Copyright © 2016 Nuevo Mundo. All rights reserved.
//

import UIKit

extension Date {

    // MARK: - Public
    init(javascriptTimestamp:Double) {
        self.init(timeIntervalSince1970:javascriptTimestamp/1000)
    }
    
    var javascriptTimestamp:Double {
        return Date.javascriptTimestamp(fromDate: self)
    }
    
    static func javascriptTimestampNow() -> Double {
        return round(Date().timeIntervalSince1970*1000) as Double
    }
    
    static func javascriptTimestamp(fromDate date:Date) -> NSNumber {
        return NSNumber(value: round(date.timeIntervalSince1970*1000) as Double)
    }
}
