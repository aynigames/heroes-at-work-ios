//
//  NSNumber+Helper.swift
//  Glup
//
//  Created by Arturo Gamarra on 9/20/16.
//  Copyright © 2016 Abstract. All rights reserved.
//

import Foundation

// MARK: - To NSNumber Extension
extension Int {
    
    // MARK: - Public
    var numberValue: NSNumber {
        return NSNumber(value: self)
    }
    
}

extension Bool {
    
    // MARK: - Public
    var numberValue: NSNumber {
        return NSNumber(value: self)
    }
    
}

extension Double {
    
    // MARK: - Public
    var numberValue: NSNumber {
        return NSNumber(value: self)
    }
    
}
