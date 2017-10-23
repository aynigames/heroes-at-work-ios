//
//  TimeIntervalHelpTest.swift
//  CoreTests
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import XCTest

class TimeIntervalHelpTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTimeFromInterval() {
        // Arrange
        let initialTimestamp:TimeInterval = 1484227815.0
        let finalTimestamp:TimeInterval = 1484257515.0
        
        // Act
        let diff = finalTimestamp - initialTimestamp
        let time = diff.time
        
        // Arrange
        XCTAssertTrue(time.hours == 8 && time.minutes == 15 && time.seconds == 0)
    }
    
}
