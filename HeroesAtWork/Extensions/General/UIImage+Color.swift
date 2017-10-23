//
//  UIImageExtension.swift
//  SOSMujer
//
//  Created by Arturo Gamarra on 2/7/16.
//  Copyright © 2016 tv.bennu. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    convenience init(color: UIColor) {
        self.init(color: color, size: CGSize(width: 1, height: 1))
    }
    
    convenience init(color: UIColor, size:CGSize) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.init(cgImage: img!.cgImage!)
    }
    
}
