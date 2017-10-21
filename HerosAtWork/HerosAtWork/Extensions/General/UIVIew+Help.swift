//
//  UIVIew+Help.swift
//  Glup
//
//  Created by Arturo Gamarra on 9/3/16.
//  Copyright © 2016 Abstract. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Public
    func parentView<T:UIView>(ofType type:T.Type) -> T? {
        guard var parentView = self.superview else {
            return nil
        }
        while(!(parentView is T)) {
            if (parentView.superview != nil) {
                parentView = parentView.superview!
            } else {
                return nil
            }
        }
        return parentView as? T
    }
    
}
