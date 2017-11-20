//
//  CreateGameViewController.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/20/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

final class CreateGameViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UIBarPositioningDelegate
extension CreateGameViewController: UIBarPositioningDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}
