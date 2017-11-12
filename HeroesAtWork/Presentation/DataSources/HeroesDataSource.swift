//
//  HeroesDataSource.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/11/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

public class HeroesDataSource: NSObject {
    
    // MARK: - Properties
    typealias HeroeCellCreator = (_ heroe:Heroe, _ inexPath:IndexPath) -> UITableViewCell
    var heroes:[Heroe]
    var heroeCellCreator:HeroeCellCreator
    
    // MARK: - Constructors
    override init() {
        self.heroes = []
        self.heroeCellCreator = { (_,_) in return UITableViewCell() }
    }
    
    init(heroes:[Heroe]) {
        self.heroes = heroes
        self.heroeCellCreator = { (_,_) in return UITableViewCell() }
    }
    
    init(heroes:[Heroe], heroeCellCreator:@escaping HeroeCellCreator) {
        self.heroes = heroes
        self.heroeCellCreator = heroeCellCreator
    }
}

// MARK: - UITableViewDataSource
extension HeroesDataSource: UITableViewDataSource {
    
    @objc public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    @objc public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let heroe = heroes[indexPath.item]
        return heroeCellCreator(heroe, indexPath)
    }
    
}
