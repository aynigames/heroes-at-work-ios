//
//  Bundle+Help.swift
//  Core
//
//  Created by Arturo Gamarra on 10/22/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import Foundation

extension Bundle {
    
    var buildVersion:String {
        return self.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    }
    
}
