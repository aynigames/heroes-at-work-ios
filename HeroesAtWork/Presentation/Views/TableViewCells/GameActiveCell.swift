//
//  GameActiveCell.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/20/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

protocol GameActiveCellProtocol: NSObjectProtocol {
    
    func gameActiveCell(_ sender:GameActiveCell, didNavigateToGame game:Game)
    func gameActiveCell(_ sender:GameActiveCell, didSelectHero hero:Hero)
    
}

final class GameActiveCell: UITableViewCell {
    
    // MARK: - Constant
    static let identifier = "GameActiveCell"
    
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate:GameActiveCellProtocol?
    var games:[Game] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 10
        }
    }
}

// MARK: - UICollectionViewDataSource
extension GameActiveCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = ActiveGameCollectionCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ActiveGameCollectionCell
        cell.game = games[indexPath.item]
        cell.delegate = self
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension GameActiveCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = games[indexPath.item]
        delegate?.gameActiveCell(self, didNavigateToGame: game)
    }
    
}

// MARK: - ActiveGameCollectionCellDelegate
extension GameActiveCell: ActiveGameCollectionCellDelegate {
    
    func activeGameCollectionCell(_ sender:ActiveGameCollectionCell, didNavigateToGame game:Game) {
        delegate?.gameActiveCell(self, didNavigateToGame: game)
    }
    
    func activeGameCollectionCell(_ sender:ActiveGameCollectionCell, didSelectHero hero:Hero) {
        delegate?.gameActiveCell(self, didSelectHero: hero)
    }
    
}
