//
//  GameHistoryCell.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit
import Core

final class GameHistoryCell: UITableViewCell {
 
    // MARK: - Constant
    static let identifier = "GameHistoryCell"
    
    // MARK: - Properties
    @IBOutlet weak var containerView: ABSRoundedBorderView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var initialDateLabel: UILabel!
    @IBOutlet weak var finalDateLAbel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var mainHeroImageView: UIImageView!
    @IBOutlet weak var mainHeroNameLabel: UILabel!
    @IBOutlet weak var mainHeroPoints: UILabel!
    @IBOutlet weak var mainHeroProgressView: UIProgressView!
    @IBOutlet weak var heroesCollectionView: UICollectionView!
    var heroDataSource:HeroDataSource!
    var game:Game! {
        didSet {
            setupInformation()
        }
    }
    
    // MARK: - Constructor
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    // MARK: - Private
    private func setupCell() {
        heroDataSource = HeroDataSource()
        heroDataSource.heroeCollectionCellCreator = { (collectionView, hero, indexPath) in
            let identifier = HeroImageCollectionCell.identifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HeroImageCollectionCell
            cell.hero = hero
            return cell
        }
    }
    
    private func setupInformation() {
        var heroes = game.sortedHeroes
        let mainHero = heroes.first
        let playedPoints = Int(game.pointsPerHero) * heroes.count
        
        // Set game info
        nameLabel.text = game.name
        initialDateLabel.text = "From: \(game.initialDate.string(fromTemplate: "ddMMyyyy"))"
        finalDateLAbel.text = "To: \(game.endDate.string(fromTemplate: "ddMMyyyy"))"
        totalPointsLabel.text = "\(playedPoints)"
        
        // Set main hero info
        mainHeroNameLabel.text = mainHero?.fullName
        mainHeroPoints.text = mainHero?.points.description
        mainHeroProgressView.progress = Float(mainHero!.points)/Float(playedPoints)
        if let url = mainHero?.imageURL {
            mainHeroImageView.af_setImage(withURL: url)
        }
        
        // Set heroes collection
        heroes.removeFirst()
        heroDataSource.heroes = heroes
        heroesCollectionView.dataSource = heroDataSource
        heroesCollectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        containerView.backgroundColor = UIColor.white
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        containerView.backgroundColor = UIColor.white
    }
    
}

extension GameHistoryCell: UICollectionViewDelegate {
    
    
    
}
