//
//  ABSCicularButton.swift
//  Glup
//
//  Created by Arturo Gamarra on 8/27/16.
//  Copyright © 2016 Abstract. All rights reserved.
//

import UIKit

@IBDesignable class ABSCircularButton: UIButton {

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
