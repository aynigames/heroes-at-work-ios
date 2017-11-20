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
        
        let heroTag1 = HeroTag.mr_createEntity(in: context)!
        heroTag1.points = 20
        heroTag1.tag = tag1
        
        let heroTag2 = HeroTag.mr_createEntity(in: context)!
        heroTag2.points = 20
        heroTag1.tag = tag2
        
        let heroTag3 = HeroTag.mr_createEntity(in: context)!
        heroTag3.points = 40
        heroTag1.tag = tag1
        
        let hero1 = Hero.mr_createEntity(in: context)!
        hero1.lastName = "Pacora"
        hero1.firstName = "Felipe"
        hero1.heroId = "1111"
        hero1.pointsToGive = 100
        hero1.points = 40
        hero1.pointsGiven = 60
        hero1.imageUrlString = "https://pbs.twimg.com/profile_images/734133345722961920/tGeWEfYN.jpg"
        hero1.addToTags(heroTag1)
        hero1.addToTags(heroTag2)
        
        let hero2 = Hero.mr_createEntity(in: context)!
        hero2.lastName = "ABC"
        hero2.firstName = "ABC"
        hero2.heroId = "1111"
        hero2.pointsToGive = 100
        hero2.points = 40
        hero2.pointsGiven = 60
        hero2.imageUrlString = "https://pbs.twimg.com/profile_images/734133345722961920/tGeWEfYN.jpg"
        hero2.addToTags(heroTag1)
        hero2.addToTags(heroTag2)
        
        let heroe3 = Hero.mr_createEntity(in: context)!
        heroe3.lastName = "XYZ"
        heroe3.firstName = "XYZ"
        heroe3.heroId = "1111"
        heroe3.pointsToGive = 100
        heroe3.points = 40
        heroe3.pointsGiven = 60
        heroe3.addToTags(heroTag3)
        
        let game = Game.mr_createEntity(in: context)!
        game.name = "hero1"
        game.gameId = UUID().uuidString
        game.pointsPerHero = 100
        game.initialDate = Date(stringDate: "10/10/2017", format: "dd/MM/yyyy")!
        game.endDate = Date(stringDate: "20/10/2017", format: "dd/MM/yyyy")!
        game.addToTags(tag1)
        game.addToTags(tag2)
        game.addToHeroes(hero1)
        game.addToHeroes(hero2)
        game.addToHeroes(heroe3)
        
        let game3 = Game.mr_createEntity(in: context)!
        game3.name = "hero1"
        game3.gameId = UUID().uuidString
        game3.pointsPerHero = 100
        game3.initialDate = Date(stringDate: "10/11/2017", format: "dd/MM/yyyy")!
        game3.endDate = Date(stringDate: "20/11/2017", format: "dd/MM/yyyy")!
        game3.addToTags(tag1)
        game3.addToTags(tag2)
        game3.addToHeroes(hero1)
        game3.addToHeroes(hero2)
        game3.addToHeroes(heroe3)
        
        let game2 = Game.mr_createEntity(in: context)!
        game2.name = "Heroe2"
        game2.gameId = UUID().uuidString
        game2.pointsPerHero = 100
        game2.initialDate = Date(stringDate: "10/11/2017", format: "dd/MM/yyyy")!
        game2.endDate = Date(stringDate: "20/11/2017", format: "dd/MM/yyyy")!
        game2.addToTags(tag1)
        game2.addToTags(tag2)
        game2.addToHeroes(hero1)
        game2.addToHeroes(hero2)
        game2.addToHeroes(heroe3)
        
        context.mr_saveToPersistentStoreAndWait()
    }
    
}
