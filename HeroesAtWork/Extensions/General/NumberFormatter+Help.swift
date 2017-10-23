//
//  NSNumberFormatter+Help.swift
//  Glup
//
//  Created by Arturo Gamarra on 8/28/16.
//  Copyright © 2016 Abstract. All rights reserved.
//

import Foundation

extension NumberFormatter {

    static let sharedFormatter: NumberFormatter = NumberFormatter()
    
    // MARK: - Public
    func number(fromCurrency currency:String) -> NSNumber? {
        self.formatterBehavior = .behavior10_4
        self.numberStyle = .decimal
        self.positiveFormat = "#0.00"
        self.usesGroupingSeparator = false
        return self.number(from: currency)
    }
    
    func currency(fromNumber number:NSNumber) -> String? {
        self.formatterBehavior = .behavior10_4
        self.numberStyle = .decimal
        self.positiveFormat = "#0.00"
        self.usesGroupingSeparator = false
        return self.string(from: number)
    }
    
    func currencyComplete(fromNumber number:NSNumber, withSymbol symbol:String) -> String {
        if let formattedNumber = self.currency(fromNumber: number) {
            return "\(symbol) \(formattedNumber)"
        }
        return ""
    }
    
}
