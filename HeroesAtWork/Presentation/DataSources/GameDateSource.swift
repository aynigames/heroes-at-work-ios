//
//  GameDateSource.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

public class GameDateSource: NSObject {
    
    // MARK: - Properties
    typealias GameTableCellCreator = (_ tableView:UITableView, _ game:Game, _ inexPath:IndexPath) -> UITableViewCell
    typealias GameCollectionCellCreator = (_ collectionView:UICollectionView, _ game:Game, _ inexPath:IndexPath) -> UICollectionViewCell
    var games:[Game]
    var gameTableCellCreator:GameTableCellCreator?
    var gameCollectionCellCreator:GameCollectionCellCreator?
    
    // MARK: - Constructors
    override init() {
        self.games = []
    }
    
    init(games:[Game]) {
        self.games = games
    }
}

// MARK: - UITableViewDataSource
extension GameDateSource: UITableViewDataSource {
    
    @objc public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    @objc public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellCreator = gameTableCellCreator else {
            return UITableViewCell()
        }
        let game = games[indexPath.item]
        return cellCreator(tableView, game, indexPath)
    }
    
}

// MARK: - UICollectionViewDataSource
extension GameDateSource: UICollectionViewDataSource {
    
    @objc public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    @objc public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellCreator = gameCollectionCellCreator else {
            return UICollectionViewCell()
        }
        let game = games[indexPath.item]
        return cellCreator(collectionView, game, indexPath)
    }
    
}
