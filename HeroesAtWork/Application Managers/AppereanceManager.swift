//
//  File.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 10/24/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit
import Core

struct AppereanceManager {
    
    static func setupApplicationAppearance() {
        setupNavigationBarAppearance()
        setupBarButtonItemAppearance()
        setupToolbarAppearance()
        setupTabBarAppearance()
    }
    
    static func setupNavigationBarAppearance() {
        let navBar = UINavigationBar.appearance()
        navBar.isTranslucent = false
        navBar.tintColor = UIColor.white
        navBar.barTintColor = UIColor.toolBar
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    static func setupBarButtonItemAppearance() {
        let navBar = UIBarButtonItem.appearance()
        navBar.tintColor = UIColor.white
    }
    
    static func setupToolbarAppearance() {
        let toolbar = UIToolbar.appearance()
        toolbar.isTranslucent = false
        toolbar.tintColor = UIColor.white
        toolbar.barTintColor = UIColor.toolBar
    }
    
    static func setupTabBarAppearance() {
        let tabBar = UITabBar.appearance()
        tabBar.isTranslucent = false
        tabBar.clipsToBounds = false
        tabBar.layer.borderWidth = 1.0
        tabBar.barTintColor = UIColor.toolBar
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = UIColor.lightGray
    }
}
