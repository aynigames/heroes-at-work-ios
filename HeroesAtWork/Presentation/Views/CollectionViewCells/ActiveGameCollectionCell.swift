//
//  GameCollectionCell.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

protocol ActiveGameCollectionCellDelegate: NSObjectProtocol {
    
    func activeGameCollectionCell(_ sender:ActiveGameCollectionCell, didNavigateToGame game:Game)
    func activeGameCollectionCell(_ sender:ActiveGameCollectionCell, didSelectHero hero:Hero)
    
}

final class ActiveGameCollectionCell: UICollectionViewCell {
 
    // MARK: - Constants
    static let identifier:String = "ActiveGameCollectionCell"
    
    // MARK: - Properties
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var remainingDaysLabel: UILabel!
    @IBOutlet var heroesImageViews: [UIImageView]!
    private var showDots:Bool = false
    private var heroes:[Hero] = []
    weak var delegate:ActiveGameCollectionCellDelegate?
    var game:Game! {
        didSet {
            gameNameLabel.text = game.name
            remainingDaysLabel.text = "Finishes in \(game.remainingDays) days"
            
            heroes = game.sortedHeroes
            showDots = heroes.count > heroesImageViews.count
            let count = showDots ? heroesImageViews.count-1 : heroes.count
            for i in 0..<count {
                if let url = heroes[i].imageURL {
                    heroesImageViews[i].af_setImage(withURL: url)
                } else {
                    heroesImageViews[i].image = heroes[i].image
                }
            }
        }
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        for imageView in heroesImageViews {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(heroImageViewTapped(_:)))
            imageView.addGestureRecognizer(tapGesture)
        }
    }
    
    // MARK: - Actions
    @IBAction func heroImageViewTapped(_ recognizer:UITapGestureRecognizer) {
        guard let imageView = recognizer.view as? UIImageView
            , let index = heroesImageViews.index(of: imageView)
            , index < heroes.count else {
            return
        }
        
        if (index == (heroesImageViews.count-1) && showDots) {
            delegate?.activeGameCollectionCell(self, didNavigateToGame: game)
            
        } else {
            let hero = heroes[index]
            delegate?.activeGameCollectionCell(self, didSelectHero: hero)
        }
        
    }
}
