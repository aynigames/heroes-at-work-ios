//
//  GamesLandingViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

final class GamesLandingViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var activeGamesCollectionView: UICollectionView!
    @IBOutlet weak var gamesTableView: UITableView!
    var activeGamesDataSource:GameDateSource!
    var historyGamesDataSource:GameDateSource!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    // MARK: - Private
    private func setupView() {
        let activeGames = Game.activeGames
        let oldGames = Game.finishedGames
        activeGamesDataSource = GameDateSource(games: activeGames)
        activeGamesDataSource.gameCollectionCellCreator = { (collectionView, game, indexPath) in
            let identifier = ActiveGameCollectionCell.identifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ActiveGameCollectionCell
            cell.game = game
            return cell
        }
        activeGamesCollectionView.dataSource = activeGamesDataSource
        
        historyGamesDataSource = GameDateSource(games: oldGames)
        historyGamesDataSource.gameTableCellCreator = { (tableView, game, indexPath) in
            let identifier = GameHistoryCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GameHistoryCell
            cell.game = game
            return cell
        }
        gamesTableView.dataSource = historyGamesDataSource
        gamesTableView.rowHeight = UITableViewAutomaticDimension
        gamesTableView.estimatedRowHeight = 260
    }
    
}

