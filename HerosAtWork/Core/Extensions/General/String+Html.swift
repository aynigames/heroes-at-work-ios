//
//  StringFormatExtension.swift
//  SOSMujer
//
//  Created by agamarra on 12/21/15.
//  Copyright © 2015 Bennu.tv. All rights reserved.
//

import Foundation
import UIKit

// String Format Extension
extension String {

    static func stringByRemoveHTMLTags(_ string:String) -> String {
        do {
            let regex = try NSRegularExpression(pattern: "<[^>]*>", options: NSRegularExpression.Options.caseInsensitive)
            return regex.stringByReplacingMatches(in: string, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, string.characters.count), withTemplate: "")
            
        } catch  {
            return string
        }
    }
    
    static func stringByDecodeHTMLString(_ string: String) -> String {
        let encodedData = string.data(using: String.Encoding.utf8)!
        let attributedOptions : [String: AnyObject] = [
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType as AnyObject,
            NSCharacterEncodingDocumentAttribute: String.Encoding.utf8 as AnyObject
        ]
        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            return attributedString.string
        } catch {
            return string
        }
    }
}
