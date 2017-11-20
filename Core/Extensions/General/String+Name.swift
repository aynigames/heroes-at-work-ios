//
//  String+Name.swift
//  Core
//
//  Created by Arturo Gamarra on 11/19/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import Foundation

extension String {
    
    public var initials:String {
        let text = self.trimmingCharacters(in: .whitespacesAndNewlines)
        let subTexts = text.split(separator: " ")
        var initials = ""
        for subText in subTexts {
            initials.append(subText.first!)
        }
        return initials
    }
    
}
