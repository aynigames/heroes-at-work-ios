//
//  ABSCircularImageView.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

@IBDesignable final class ABSCircularImageView: UIImageView {

    // MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }
    
    // MARK: - Private
    fileprivate func setupButton() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }

}
