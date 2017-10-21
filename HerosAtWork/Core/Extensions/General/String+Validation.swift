//
//  String+Validation.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 6/23/15.
//  Copyright (c) 2015 Nuevo Mundo. All rights reserved.
//

import Foundation

extension String {
   
    static func isEmail(_ email:String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTester = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailTester.evaluate(with: email)
    }
    
    static func isAlphaNumeric(_ text:String) -> Bool {
        let set = CharacterSet.alphanumerics
        return text.rangeOfCharacter(from: set) == nil
    }
    
    static func isAlphaOnly(_ text:String) -> Bool {
        var set = CharacterSet(charactersIn: "aábcdeéfghiíjklmnoópqrstuúvwxyzAÁBCDEÉFGHIÍJKLMNOÓPQRSTUÚVWXYZ_")
        set = set.inverted
        return text.rangeOfCharacter(from: set) == nil
    }
    
    static func isNumericOnly(_ text:String) -> Bool {
        let set = CharacterSet.decimalDigits
        return text.rangeOfCharacter(from: set) == nil
    }
    
}
