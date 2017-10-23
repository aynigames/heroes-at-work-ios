//
//  ABSUnderLineButton.swift
//  Glup
//
//  Created by Arturo Gamarra on 8/27/16.
//  Copyright © 2016 Abstract. All rights reserved.
//

import UIKit

@IBDesignable class ABSUnderLineButton: UIButton {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // need to put the line at top of descenders (negative value)
        guard let textRect = self.titleLabel?.frame
            , let descender = self.titleLabel?.font.descender
            , let contextRef = UIGraphicsGetCurrentContext() else {
            return
        }
        contextRef.setStrokeColor((self.titleLabel?.textColor.cgColor)!)
        contextRef.move(to: CGPoint(x: textRect.origin.x, y: textRect.origin.y + textRect.size.height + descender + 2))
        contextRef.addLine(to: CGPoint(x: textRect.origin.x + textRect.size.width, y: textRect.origin.y + textRect.size.height + descender + 2))
        contextRef.closePath()
        contextRef.drawPath(using: .stroke)
    }

}
