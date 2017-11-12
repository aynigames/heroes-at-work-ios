//
//  Game+CoreDataProperties.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/11/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var name: String?
    @NSManaged public var gameId: String?
    @NSManaged public var pointsPerHero: Int32
    @NSManaged public var initialDate: NSDate?
    @NSManaged public var endDate: NSDate?
    @NSManaged public var heroes: NSSet?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for heroes
extension Game {

    @objc(addHeroesObject:)
    @NSManaged public func addToHeroes(_ value: Heroe)

    @objc(removeHeroesObject:)
    @NSManaged public func removeFromHeroes(_ value: Heroe)

    @objc(addHeroes:)
    @NSManaged public func addToHeroes(_ values: NSSet)

    @objc(removeHeroes:)
    @NSManaged public func removeFromHeroes(_ values: NSSet)

}

// MARK: Generated accessors for tags
extension Game {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}
