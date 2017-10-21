//
//  File.swift
//  SOSMujer
//
//  Created by Arturo Gamarra on 2/7/16.
//  Copyright © 2016 tv.bennu. All rights reserved.
//

import Foundation

extension String {
    
    static func matches(forRegex regex: String!, inText text: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
}
