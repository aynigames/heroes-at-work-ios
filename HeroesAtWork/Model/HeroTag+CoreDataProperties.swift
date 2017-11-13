//
//  HeroTag+CoreDataProperties.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//
//

import Foundation
import CoreData


extension HeroTag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeroTag> {
        return NSFetchRequest<HeroTag>(entityName: "HeroTag")
    }

    @NSManaged public var points: Int32
    @NSManaged public var heroes: Hero?
    @NSManaged public var tag: Tag?

}
