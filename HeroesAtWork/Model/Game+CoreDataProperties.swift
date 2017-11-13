//
//  Game+CoreDataProperties.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var endDate: Date
    @NSManaged public var gameId: String
    @NSManaged public var initialDate: Date
    @NSManaged public var name: String
    @NSManaged public var pointsPerHero: Int32
    @NSManaged public var gameMaster: Hero?
    @NSManaged public var heroes: NSSet?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for heroes
extension Game {

    @objc(insertObject:inHeroesAtIndex:)
    @NSManaged public func insertIntoHeroes(_ value: Hero, at idx: Int)

    @objc(removeObjectFromHeroesAtIndex:)
    @NSManaged public func removeFromHeroes(at idx: Int)

    @objc(insertHeroes:atIndexes:)
    @NSManaged public func insertIntoHeroes(_ values: [Hero], at indexes: NSIndexSet)

    @objc(removeHeroesAtIndexes:)
    @NSManaged public func removeFromHeroes(at indexes: NSIndexSet)

    @objc(replaceObjectInHeroesAtIndex:withObject:)
    @NSManaged public func replaceHeroes(at idx: Int, with value: Hero)

    @objc(replaceHeroesAtIndexes:withHeroes:)
    @NSManaged public func replaceHeroes(at indexes: NSIndexSet, with values: [Hero])

    @objc(addHeroesObject:)
    @NSManaged public func addToHeroes(_ value: Hero)

    @objc(removeHeroesObject:)
    @NSManaged public func removeFromHeroes(_ value: Hero)

    @objc(addHeroes:)
    @NSManaged public func addToHeroes(_ values: NSOrderedSet)

    @objc(removeHeroes:)
    @NSManaged public func removeFromHeroes(_ values: NSOrderedSet)

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
