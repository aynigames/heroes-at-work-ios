//
//  GameCollectionCell.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

final class ActiveGameCollectionCell: UICollectionViewCell {
 
    // MARK: - Constants
    static let identifier:String = "ActiveGameCollectionCell"
    
    // MARK: - Properties
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var remainingDaysLabel: UILabel!
    @IBOutlet var heroesImageViews: [UIImageView]!
    
    var game:Game! {
        didSet {
            gameNameLabel.text = game.name
            remainingDaysLabel.text = "Finishes in \(game.remainingDays) days"
            
            let heroes = game.sortedHeroes
            let showDots = heroes.count > heroesImageViews.count
            let count = showDots ? heroesImageViews.count-1 : heroes.count
            for i in 0..<count {
                if let url = heroes[i].imageURL {
                    heroesImageViews[i].af_setImage(withURL: url)
                }
            }
        }
    }
    
}
