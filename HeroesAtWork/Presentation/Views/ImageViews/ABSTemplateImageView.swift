//
//  ABSTemplateImageView.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 10/25/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

@IBDesignable class ABSTemplateImageView: UIImageView {

    override var image: UIImage? {
        didSet {
            let templateImage = super.image?.withRenderingMode(.alwaysTemplate)
            super.image = templateImage
        }
    }
}
