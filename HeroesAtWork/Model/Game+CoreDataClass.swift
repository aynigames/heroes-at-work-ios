//
//  Game+CoreDataClass.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/11/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//
//

import Foundation
import CoreData
import Core

@objc(Game)
public class Game: NSManagedObject {

    // MARK: - Public
    public var remainingDays:Int {
        guard let startDate = initialDate as Date?
            , let endDate = endDate as Date? else {
                return 0
        }
        let days = Date.days(fromDate: startDate, toDate: endDate)
        return days >= 0 ? days : 0
    }
    
    public class var activeGames:[Game] {
        let predicate = NSPredicate(format: "endDate >= %@", Date.today as NSDate)
        guard let games = Game.mr_findAllSorted(by: "endDate", ascending: false, with: predicate) as? [Game] else {
            return []
        }
        return games
    }
    
    public class var finishedGames:[Game] {
        let predicate = NSPredicate(format: "endDate < %@", Date.today as NSDate)
        guard let games = Game.mr_findAllSorted(by: "endDate", ascending: false, with: predicate) as? [Game] else {
            return []
        }
        return games
    }
    
    
}
