//
//  TabBarViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.rightBarButtonItems = viewController.navigationItem.rightBarButtonItems
        self.navigationItem.leftBarButtonItems = viewController.navigationItem.leftBarButtonItems
        self.navigationItem.title = viewController.navigationItem.title
    }

}
