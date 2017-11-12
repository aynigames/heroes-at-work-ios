//
//  MockDataService.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/11/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import MagicalRecord

public struct MockDataService {
    
    static func createInitialData() {
        let context = NSManagedObjectContext.mr_default()
        if (Game.mr_findAll()?.count != 0) {
            return
        }
        
        let tag1 = Tag.mr_createEntity(in: context)!
        tag1.tagId = UUID().uuidString
        tag1.name = "Calidad de trabajo"
        
        let tag2 = Tag.mr_createEntity(in: context)!
        tag2.tagId = UUID().uuidString
        tag2.name = "Trabajo en equipo"
        
        let heroTag1 = HeroeTag.mr_createEntity(in: context)!
        heroTag1.points = 20
        heroTag1.tag = tag1
        
        let heroTag2 = HeroeTag.mr_createEntity(in: context)!
        heroTag2.points = 20
        heroTag1.tag = tag2
        
        let heroTag3 = HeroeTag.mr_createEntity(in: context)!
        heroTag3.points = 40
        heroTag1.tag = tag1
        
        let heroe1 = Heroe.mr_createEntity(in: context)!
        heroe1.lastName = "Pacora"
        heroe1.firstName = "Felipe"
        heroe1.heroeId = "1111"
        heroe1.pointsToGive = 100
        heroe1.points = 40
        heroe1.pointsGiven = 60
        heroe1.addToTags(heroTag1)
        heroe1.addToTags(heroTag2)
        
        let heroe2 = Heroe.mr_createEntity(in: context)!
        heroe2.lastName = "ABC"
        heroe2.firstName = "ABC"
        heroe2.heroeId = "1111"
        heroe2.pointsToGive = 100
        heroe2.points = 40
        heroe2.pointsGiven = 60
        heroe2.addToTags(heroTag1)
        heroe2.addToTags(heroTag2)
        
        let heroe3 = Heroe.mr_createEntity(in: context)!
        heroe3.lastName = "XYZ"
        heroe3.firstName = "XYZ"
        heroe3.heroeId = "1111"
        heroe3.pointsToGive = 100
        heroe3.points = 40
        heroe3.pointsGiven = 60
        heroe3.addToTags(heroTag3)
        
        let game = Game.mr_createEntity(in: context)!
        game.name = "Heroe1"
        game.gameId = UUID().uuidString
        game.pointsPerHero = 100
        game.initialDate = Date(stringDate: "10/10/2017", format: "dd/MM/yyyy") as NSDate?
        game.endDate = Date(stringDate: "20/10/2017", format: "dd/MM/yyyy")! as NSDate?
        game.addToTags(tag1)
        game.addToTags(tag2)
        game.addToHeroes(heroe1)
        game.addToHeroes(heroe2)
        game.addToHeroes(heroe3)
        
        let game2 = Game.mr_createEntity(in: context)!
        game2.name = "Heroe2"
        game2.gameId = UUID().uuidString
        game2.pointsPerHero = 100
        game2.initialDate = Date(stringDate: "10/11/2017", format: "dd/MM/yyyy") as NSDate?
        game2.endDate = Date(stringDate: "20/11/2017", format: "dd/MM/yyyy")! as NSDate?
        game2.addToTags(tag1)
        game2.addToTags(tag2)
        game2.addToHeroes(heroe1)
        game2.addToHeroes(heroe2)
        game2.addToHeroes(heroe3)
        
        context.mr_saveToPersistentStoreAndWait()
    }
    
}
