//
//  CALayer+Animation.swift
//  TaxiPassUser
//
//  Created by Arturo Gamarra on 3/11/17.
//  Copyright © 2017 Bitmap. All rights reserved.
//

import UIKit

extension CALayer {
    
    func pauseAnimation() {
        let pausedTime = self.convertTime(CACurrentMediaTime(), from: nil)
        self.speed = 0.0
        self.timeOffset = pausedTime
    }
    
    func resumeAnimation() {
        let pausedTime = self.timeOffset
        self.speed = 1.0
        self.timeOffset = 0.0
        self.beginTime = 0.0
        let timeSincePause = self.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        self.beginTime = timeSincePause
    }
    
}
