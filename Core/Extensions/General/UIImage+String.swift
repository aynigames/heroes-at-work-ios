//
//  UIImage+Text.swift
//  Core
//
//  Created by Arturo Gamarra on 11/19/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

extension UIImage {
    
    // MARK: - Lifecycle
    public convenience init(text:String, textColor:UIColor, font:UIFont, backgroundColor:UIColor, size:CGSize) {
        let attr = [NSAttributedStringKey.font: font,
                    NSAttributedStringKey.foregroundColor: textColor]
        self.init(text: text, textAttributes: attr, backgroundColor: backgroundColor, size: size)
    }
    
    public  convenience init(text:String, textAttributes: [NSAttributedStringKey : AnyObject], backgroundColor:UIColor, size:CGSize) {
        let image = UIImage.image(fromText: text, ofSize: size, backgroundColor: backgroundColor, textAttributes: textAttributes)
        self.init(cgImage: image.cgImage!)
    }
    
    // MARK: - Public
    public class func image(fromText text: String
        , ofSize size:CGSize
        , backgroundColor: UIColor
        , textAttributes: [NSAttributedStringKey : AnyObject]) -> UIImage {
        
        let scale: CGFloat = UIScreen.main.scale
        var aSize: CGSize = size
        aSize.width = (aSize.width * scale) / scale
        aSize.height = (aSize.height * scale) / scale
        
        UIGraphicsBeginImageContextWithOptions(aSize, false, scale)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(backgroundColor.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        // Draw text in the context
        let textSize: CGSize = text.size(withAttributes: textAttributes)
        let bounds: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        text.draw(in: CGRect(x: bounds.midX - textSize.width / 2,
                             y: bounds.midY - textSize.height / 2,
                             width: textSize.width,
                             height: textSize.height),
                  withAttributes: textAttributes)
        
        let snapshot: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        
        return snapshot
    }
    
}
