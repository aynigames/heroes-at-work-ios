
//
//  String+Size.swift
//  Nuevo Mundo
//
//  Created by Arturo Gamarra on 5/8/16.
//  Copyright © 2016 Nuevo Mundo. All rights reserved.
//

import UIKit

extension String {

    func size(withFont font:UIFont) -> CGSize {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.size
    }
    
    func height(forPreferedWidth width: CGFloat, withFont font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }

}
