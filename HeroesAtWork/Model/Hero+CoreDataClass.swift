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
import Core

@objc(Hero)
public class Hero: NSManagedObject {

    // MARK: - Properties
    public override var description: String {
        return fullName
    }
    
    var fullName:String {
        guard let firstName = self.firstName
            , let lastName = self.lastName else {
                return ""
        }
        return "\(firstName) \(lastName)"
    }
    
    var imageURL:URL? {
        if let url = imageUrlString {
            return URL(string: url)
        }
        return nil
    }
    
    var image:UIImage {
        let initials = fullName.initials
        return UIImage(fromInitials: initials)
    }
    
}
