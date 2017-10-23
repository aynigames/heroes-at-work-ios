//
//  NSDateFormatter+Singleton.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 16/01/15.
//  Copyright (c) 2015 Nuevo Mundo. All rights reserved.
//

import Foundation

extension DateFormatter {

    public static let shared:DateFormatter = DateFormatter()
    
    // MARK: - Public
    public func string(fromDate date:Date, withFormat format:String) -> String {
        return string(fromDate: date, withFormat: format, locale: nil)
    }
    
    public func string(fromDate date:Date, usingTemplate template:String) -> String {
        return string(fromDate: date, usingTemplate:template, locale:nil)
    }
    
    public func string(fromDate date:Date, usingTemplate template:String, locale:Locale?) -> String {
        let workLocale = locale ?? Locale.current
        guard let format = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: workLocale) else {
            return ""
        }
        return string(fromDate: date, withFormat:format, locale:locale)
    }
    
    public func string(fromDate date:Date, withFormat format:String, locale:Locale?) -> String {
        self.dateFormat = format
        self.timeZone = TimeZone.autoupdatingCurrent
        self.locale = locale ?? Locale(identifier: "en_US_POSIX")
        let dateString = self.string(from: date)
        return dateString
    }
    
    public func date(fromString dateString:String, withFormat format:String) -> Date? {
        return date(fromString: dateString, withFormat: format, locale: nil)
    }
    
    public func date(fromString dateString:String, usingTemplate template:String) -> Date? {
        return date(fromString: dateString, usingTemplate: template, locale: nil)
    }
    
    public func date(fromString dateString:String, usingTemplate template:String, locale:Locale?) -> Date? {
        let workLocale = locale ?? Locale.current
        guard let format = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: workLocale) else {
            return nil
        }
        return date(fromString: dateString, withFormat: format, locale: locale)
    }
    
    public func date(fromString dateString:String, withFormat format:String, locale:Locale?) -> Date? {
        self.dateFormat = format
        self.timeZone = TimeZone.autoupdatingCurrent
        self.locale = locale ?? Locale(identifier: "en_US_POSIX")
        let date = self.date(from: dateString)
        return date;
    }
}
