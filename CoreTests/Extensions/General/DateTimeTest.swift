//
//  DateTimeTest.swift
//  CoreTests
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import XCTest

class DateTimeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDateTimeTest() {
        // Arrange
        let inputDate = "2017-10-23 08:30:15"
        let date = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        
        // Act
        let hours = date.hours
        let minutes = date.minutes
        let seconds = date.seconds
        
        // Assert
        XCTAssertTrue(hours == 8 && minutes == 30 && seconds == 15)
    }
    
}
