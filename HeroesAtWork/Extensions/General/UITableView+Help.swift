//
//  UITableView+Help.swift
//  HeroesAtWork
//
//  Created by Arturo Gamarra on 11/19/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import UIKit

extension UITableView {
    
    // MARK: - Public
    public var shouldUpdateHeaderViewFrame:Bool {
        guard let headerView = self.tableHeaderView else {
            return false
        }
        let oldSize = headerView.bounds.size
        headerView.layoutIfNeeded()
        let newSize = headerView.bounds.size
        return oldSize.height != newSize.height || oldSize.width != newSize.width
    }
    
    public func configureHeaderView() {
        guard let headerView = self.tableHeaderView else {
            return
        }
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
}
