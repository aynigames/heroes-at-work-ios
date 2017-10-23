//
//  RoundedButton.swift
//  Spontivity
//
//  Created by Arturo Gamarra on 24/11/14.
//  Copyright (c) 2014 WorryFreeLabs. All rights reserved.
//

import UIKit

@IBDesignable class ABSRoundedBorderButton: UIButton {

    // MARK: - Properties
    @IBInspectable var cornerRadius:CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
    @IBInspectable var borderColor:UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupButton();
    }
    
    // MARK: - Private
    fileprivate func setupButton() {
        self.clipsToBounds = true;
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
    }
}
