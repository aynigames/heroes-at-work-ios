//
//  BaseViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/20/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.background
    }
    
}
