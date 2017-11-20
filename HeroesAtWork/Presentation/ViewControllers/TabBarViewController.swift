//
//  TabBarViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/12/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.rightBarButtonItems = viewControllers?.first?.navigationItem.rightBarButtonItems
        self.navigationItem.leftBarButtonItems = viewControllers?.first?.navigationItem.leftBarButtonItems
        self.navigationItem.title = viewControllers?.first?.navigationItem.title
    }
    
    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.rightBarButtonItems = viewController.navigationItem.rightBarButtonItems
        self.navigationItem.leftBarButtonItems = viewController.navigationItem.leftBarButtonItems
        self.navigationItem.title = viewController.navigationItem.title
    }

}
