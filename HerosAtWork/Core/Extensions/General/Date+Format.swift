//
//  NSDate+Helper.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 21/01/15.
//  Copyright (c) 2015 Nuevo Mundo. All rights reserved.
//

import Foundation

extension Date {
    
    init?(stringDate:String, format:String) {
        if let date = DateFormatter.sharedFormatter.date(fromString: stringDate, withFormat: format) {
            self.init(timeInterval:0, since:date)
        } else {
            return nil
        }
    }
    
    func string(withFormat format:String) -> String {
        return DateFormatter.sharedFormatter.string(fromDate: self, withFormat: format);
    }
    
    func monthName() -> String {
        let formatter = DateFormatter.sharedFormatter
        formatter.locale = Locale.current
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "es")
        let dateComponents = calendar.dateComponents([.day, .month, .year], from: self)
        return calendar.monthSymbols[dateComponents.month! - 1].capitalized
    }
}
