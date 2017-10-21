//
//  String+Cast.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 5/8/16.
//  Copyright © 2016 Nuevo Mundo. All rights reserved.
//

import UIKit

extension String {

    var int: Int? {
        return Int(self)
    }
    
    var intValue:Int {
        if let value = self.int {
            return value
        }
        return 0;
    }
    
    var float: Float? {
        return Float(self)
    }
    
    var floatValue: Float {
        if let value = self.float {
            return value;
        }
        return 0.0
    }
    
    var double: Double? {
        return Double(self)
    }
    
    var doubleValue: Double {
        if let value = self.double {
            return value;
        }
        return 0.0
    }
    
    var number:NSNumber? {
        return NumberFormatter.sharedFormatter.number(from: self)
    }
    
    var numberValue: NSNumber {
        if let value = NumberFormatter.sharedFormatter.number(from: self) {
            return value
        }
        return NSNumber(value: 0 as Double)
    }
    
}
