//
//  HeroeImageCollectionCell.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit
import AlamofireImage

final class HeroImageCollectionCell: UICollectionViewCell {
    
    // MARK: - Constant
    static let identifier = "HeroImageCollectionCell"
    
    // MARK: - Properties
    @IBOutlet weak var imageView:UIImageView!
    var hero:Hero! {
        didSet {
            if let url = hero.imageURL {
                imageView.af_setImage(withURL: url)
            } else {
                imageView.image = hero.image
            }
        }
    }
    
}
