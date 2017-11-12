//
//  Heroe+CoreDataProperties.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/11/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//
//

import Foundation
import CoreData


extension Heroe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Heroe> {
        return NSFetchRequest<Heroe>(entityName: "Heroe")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    @NSManaged public var heroeId: String?
    @NSManaged public var pointsToGive: Int32
    @NSManaged public var points: Int32
    @NSManaged public var pointsGiven: Int32
    @NSManaged public var games: NSSet?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for games
extension Heroe {

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
extension Heroe {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: HeroeTag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: HeroeTag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}
