//
//  ViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 10/21/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let templateImage = logoImageView.image?.withRenderingMode(.alwaysTemplate)
        logoImageView.image = templateImage
        logoImageView.tintColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setToolbarHidden(false, animated: animated)
    }

}



