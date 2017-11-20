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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if (gamesTableView.shouldUpdateHeaderViewFrame) {
            gamesTableView.beginUpdates()
            gamesTableView.endUpdates()
        }
    }
    
    // MARK: - Private
    private func setupView() {
        gamesTableView.configureHeaderView()
        
        let activeGames = Game.activeGames
        let oldGames = Game.finishedGames
        activeGamesDataSource = GameDateSource(games: activeGames)
        activeGamesDataSource.gameCollectionCellCreator = { (collectionView, game, indexPath) in
            let identifier = ActiveGameCollectionCell.identifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ActiveGameCollectionCell
            cell.game = game
            cell.delegate = self
            return cell
        }
        activeGamesCollectionView.dataSource = activeGamesDataSource
        if let layout = activeGamesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 10
        }
        
        historyGamesDataSource = GameDateSource(games: oldGames)
        historyGamesDataSource.gameTableCellCreator = { (tableView, game, indexPath) in
            let identifier = GameHistoryCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GameHistoryCell
            cell.game = game
            cell.delegate = self
            return cell
        }
        gamesTableView.dataSource = historyGamesDataSource
        gamesTableView.rowHeight = UITableViewAutomaticDimension
        gamesTableView.estimatedRowHeight = 260
    }
    
}

extension GamesLandingViewController: ActiveGameCollectionCellDelegate {
    
    func activeGameCollectionCell(_ sender: ActiveGameCollectionCell, didSelectHero hero: Hero) {
        // TODO: navigate to hero
        print(hero)
    }
    
    func activeGameCollectionCell(_ sender: ActiveGameCollectionCell, didNavigateToGame game: Game) {
        // Navigate to game
    }
    
}

extension GamesLandingViewController: GameHistoryCellDelegate {
    
    func gameHistoryCell(_ sender: GameHistoryCell, didSelectHero hero: Hero) {
        // TODO: navigate to hero
        print(hero)
    }
    
}
