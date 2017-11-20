//
//  GamesLandingViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

final class GamesLandingViewController: BaseViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var historyGames:[Game] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private
    private func setupView() {
        historyGames = Game.finishedGames
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 260
    }
    
}

extension GamesLandingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        }
        return historyGames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let identifier = GameActiveCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GameActiveCell
            cell.games = Game.activeGames
            cell.delegate = self
            return cell
            
        } else {
            let identifier = GameHistoryCell.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GameHistoryCell
            cell.game = historyGames[indexPath.item]
            cell.delegate = self
            return cell
        }
    }
}

extension GamesLandingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return NSLocalizedString("games_landing_in_progress", comment: "In Progress")
        } else {
            return NSLocalizedString("games_landing_history", comment: "History")
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section != 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("GO TO GAME")
    }
}

extension GamesLandingViewController: GameActiveCellProtocol {
    
    func gameActiveCell(_ sender:GameActiveCell, didSelectHero hero:Hero) {
        // TODO: navigate to hero
        print(hero)
    }
    
    func gameActiveCell(_ sender:GameActiveCell, didNavigateToGame game:Game) {
        // Navigate to game
        print("GO TO GAME")
    }
    
}

extension GamesLandingViewController: GameHistoryCellDelegate {
    
    func gameHistoryCell(_ sender: GameHistoryCell, didSelectHero hero: Hero) {
        // TODO: navigate to hero
        print(hero)
    }
    
}
