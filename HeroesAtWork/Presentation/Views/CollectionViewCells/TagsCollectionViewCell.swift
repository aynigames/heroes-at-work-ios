//
//  TagsCollectionViewCell.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/27/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

final class TagsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    static let identifier = "TagsCollectionViewCell"
    
    // MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: - Actions
    @IBAction func removeButtonTapped(_ sender: UIButton) {
        
    }
    
}
