//
//  UINavigationController+Navigation.swift
//  Glup
//
//  Created by Mariano Cornejo on 9/6/16.
//  Copyright © 2016 Abstract. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
 
    func viewController<T:UIViewController>(ofType type:T.Type) -> T? {
        for viewcontroller in self.viewControllers {
            if viewcontroller is T {
                return viewcontroller as? T
            }
        }
        return nil
    }
    
    func popToViewController<T:UIViewController>(ofType type:T.Type, animated:Bool) {
        guard let vc:T = self.viewController(ofType: type) else {
            return
        }
        let _ = self.popToViewController(vc, animated: animated)
    }
    
    func popToViewController(ofClass aClass: AnyClass, animated: Bool) {
        let viewControllers = self.viewControllers
        for viewController in viewControllers {
            if viewController.isKind(of: aClass) {
                self.popToViewController(viewController, animated: animated)
                return
            }
        }
    }
    
    func push(viewController:UIViewController, skipingViewController:UIViewController, animated:Bool) {
        self.push(viewController: viewController, skipingViewControllers: [skipingViewController], animated: animated)
    }
    
    func push(viewController:UIViewController, skipingViewControllers:[UIViewController], animated:Bool) {
        var controllers = self.viewControllers
        for vc in skipingViewControllers {
            controllers.append(vc)
        }
        controllers.append(viewController)
        self.setViewControllers(controllers, animated: animated)
    }
    
    func popToRootViewControllerAndPush(viewController:UIViewController, animated:Bool) {
        guard let rootViewController = self.viewControllers.first else {
            return
        }
        self.pop(toViewController:rootViewController, andPushViewController:viewController, skipingViewControllers:nil, animated:animated)
    }
    
    func popToRootViewControllerAndPush(viewController:UIViewController, skipingViewController:UIViewController, animated:Bool) {
        self.popToRootViewControllerAndPush(viewController: viewController, skipingViewControllers: [skipingViewController], animated: animated)
    }
    
    func popToRootViewControllerAndPush(viewController:UIViewController, skipingViewControllers:[UIViewController]?, animated:Bool) {
        guard let rootViewController = self.viewControllers.first else {
            return
        }
        self.pop(toViewController:rootViewController, andPushViewController:viewController, skipingViewControllers:skipingViewControllers, animated:animated)
    }
    
    func pop(toViewController:UIViewController, andPushViewController viewController:UIViewController, animated:Bool) {
        self.pop(toViewController:toViewController, andPushViewController:viewController, skipingViewControllers:nil, animated:animated)
    }
    
    func pop(toViewController:UIViewController, andPushViewController viewController:UIViewController, skipingViewController:UIViewController, animated:Bool) {
        self.pop(toViewController:toViewController, andPushViewController:viewController, skipingViewControllers:[skipingViewController], animated:animated)
    }
    
    func pop(toViewController:UIViewController, andPushViewController viewController:UIViewController, skipingViewControllers:[UIViewController]?, animated:Bool) {
        guard let index = self.viewControllers.index(of: toViewController) else {
            return
        }
        var viewControllers = self.viewControllers
        viewControllers.removeSubrange((index+1)..<viewControllers.count)
        
        if let skipingViewControllers = skipingViewControllers {
            for vc in skipingViewControllers {
                viewControllers.append(vc)
            }
        }
        
        viewControllers.append(viewController)
        self.setViewControllers(viewControllers, animated: animated)
    }
}
