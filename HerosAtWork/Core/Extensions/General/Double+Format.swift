//
//  Double+Helper.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 19/01/15.
//  Copyright (c) 2015 Nuevo Mundo. All rights reserved.
//

import Foundation

extension Double {
    
    // MARK: - Private
    func currencyFormat(withSymbol symbol:String, withDecimalPoints decimalPoints:UInt) -> String{
        let price = self.format(".\(decimalPoints)")
        return "\(symbol) \(price)"
    }
    
    // MARK: - Public
    func format(_ f: String) -> String {
        return NSString(format: "%\(f)f" as NSString, self) as String
    }
    
    func currencyIntegerFormat() -> String {
        return currencyFormat(withSymbol: "US$", withDecimalPoints: 0)
    }
    
    func currencyIntegerFormat(withSymbol symbol:String) -> String {
        return currencyFormat(withSymbol: symbol, withDecimalPoints: 0)
    }
    
    func currencyDecimalFormat() -> String {
        return currencyFormat(withSymbol: "US$", withDecimalPoints: 2)
    }
    
    func currencyDecimalFormat(withSymbol symbol:String) -> String {
        return currencyFormat(withSymbol: symbol, withDecimalPoints: 2)
    }

}
