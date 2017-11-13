//
//  HeroesDataSource.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/11/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

public class HeroDataSource: NSObject {
    
    // MARK: - Properties
    typealias HeroeTableCellCreator = (_ tableView:UITableView, _ hero:Hero, _ inexPath:IndexPath) -> UITableViewCell
    typealias HeroeCollectionCellCreator = (_ collectionView:UICollectionView, _ hero:Hero, _ inexPath:IndexPath) -> UICollectionViewCell
    var heroes:[Hero]
    var heroeTableCellCreator:HeroeTableCellCreator?
    var heroeCollectionCellCreator:HeroeCollectionCellCreator?
    
    // MARK: - Constructors
    override init() {
        self.heroes = []
    }
    
    init(heroes:[Hero]) {
        self.heroes = heroes
    }
}

// MARK: - UITableViewDataSource
extension HeroDataSource: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellCreator = heroeTableCellCreator else {
            return UITableViewCell()
        }
        let hero = heroes[indexPath.item]
        return cellCreator(tableView, hero, indexPath)
    }
    
}

// MARK: - UITableViewDataSource
extension HeroDataSource: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellCreator = heroeCollectionCellCreator else {
            return UICollectionViewCell()
        }
        let hero = heroes[indexPath.item]
        return cellCreator(collectionView, hero, indexPath)
    }
    
}
