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
            remainingDaysLabel.text = "Remaining days \(game.remainingDays)"
            // TODO: - set hero
        }
    }
    
}
