//
//  AddTableViewHeader.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/26/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

protocol AddTableViewHeaderDelegate: NSObjectProtocol {
    
    func addTableViewHeader(_ sender:AddTableViewHeader, addButtonDidTapped button:UIButton)
    
}

final class AddTableViewHeader: UITableViewHeaderFooterView {
    
    // MARK: - Constants
    static let identifier = "AddTableViewHeader"
    
    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    weak var delegate:AddTableViewHeaderDelegate?

    // MARK: - Actions
    @IBAction func addButtonTepped(_ sender: UIButton) {
        delegate?.addTableViewHeader(self, addButtonDidTapped: sender)
    }
    
}
