//
//  HeroeTag+CoreDataProperties.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/11/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//
//

import Foundation
import CoreData


extension HeroeTag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeroeTag> {
        return NSFetchRequest<HeroeTag>(entityName: "HeroeTag")
    }

    @NSManaged public var points: Int32
    @NSManaged public var heroes: Heroe?
    @NSManaged public var tag: Tag?

}
