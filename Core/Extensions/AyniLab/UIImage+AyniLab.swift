//
//  UIImage+AyniLab.swift
//  Core
//
//  Created by Arturo Gamarra on 11/19/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import Foundation

extension UIImage {
    
    public convenience init(fromInitials initials:String) {
        let font = UIFont.preferredFont(forTextStyle: .headline)
        let backgroundColor = UIColor.primary
        let textColor = UIColor.white
        let size = CGSize(width: 80, height: 80)
        self.init(text: initials, textColor: textColor, font: font, backgroundColor: backgroundColor, size: size)
    }
    
}
