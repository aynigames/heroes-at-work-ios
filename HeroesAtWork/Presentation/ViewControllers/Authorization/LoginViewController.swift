//
//  ViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 10/21/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}



