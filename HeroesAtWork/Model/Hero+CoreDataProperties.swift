//
//  Hero+CoreDataProperties.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//
//

import Foundation
import CoreData


extension Hero {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hero> {
        return NSFetchRequest<Hero>(entityName: "Hero")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var heroId: String?
    @NSManaged public var imageUrlString: String?
    @NSManaged public var lastName: String?
    @NSManaged public var points: Int32
    @NSManaged public var pointsGiven: Int32
    @NSManaged public var pointsToGive: Int32
    @NSManaged public var cretedGames: Game?
    @NSManaged public var games: NSSet?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for games
extension Hero {

    @objc(addGamesObject:)
    @NSManaged public func addToGames(_ value: Game)

    @objc(removeGamesObject:)
    @NSManaged public func removeFromGames(_ value: Game)

    @objc(addGames:)
    @NSManaged public func addToGames(_ values: NSSet)

    @objc(removeGames:)
    @NSManaged public func removeFromGames(_ values: NSSet)

}

// MARK: Generated accessors for tags
extension Hero {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: HeroTag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: HeroTag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}
