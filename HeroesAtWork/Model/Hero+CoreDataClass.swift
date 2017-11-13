//
//  Hero+CoreDataClass.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Hero)
public class Hero: NSManagedObject {

    // MARK: - Properties
    public override var description: String {
        return fullName
    }
    
    var imageURL:URL? {
        if let url = imageUrlString {
            return URL(string: url)
        }
        return nil
    }
    
    var fullName:String {
        guard let firstName = self.firstName
            , let lastName = self.lastName else {
            return ""
        }
        return "\(firstName) \(lastName)"
    }
    
}
