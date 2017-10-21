//
//  UIViewController+Help.swift
//  TaxiPassUser
//
//  Created by Arturo Gamarra on 4/16/17.
//  Copyright © 2017 Bitmap. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func instance<T:UIViewController>(fromIdentifer identifier:String, inStoryboardNamed storyboardName:String) -> T? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    }
    
    func addChildViewController(_ viewController:UIViewController, inView view:UIView) {
        
        viewController.willMove(toParentViewController: self)
        self.addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
    }
}
