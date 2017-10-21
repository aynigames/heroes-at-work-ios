//
//  NSDateFormatter+Singleton.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 16/01/15.
//  Copyright (c) 2015 Nuevo Mundo. All rights reserved.
//

import Foundation

public let kDateFormatter = "dd/MM/yyyy hh:mm a";
public let kJSONDateFormatter = "yyyy-MM-dd\'T\'HH:mm:ss";

extension DateFormatter {

    static let sharedFormatter:DateFormatter = DateFormatter()
    
    // MARK: - Public
    func string(fromDate date:Date, withFormat format:String) -> String {
        self.dateFormat = format
        self.timeZone = TimeZone.autoupdatingCurrent
        self.locale = Locale(identifier: "en_US_POSIX")
        let dateString = self.string(from: date)
        return dateString
    }
    
    func date(fromString dateString:String, withFormat format:String) -> Date? {
        self.dateFormat = format
        self.timeZone = TimeZone.autoupdatingCurrent
        self.locale = Locale(identifier: "en_US_POSIX")
        let date = self.date(from: dateString)
        return date;
    }
}
