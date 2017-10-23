//
//  DateJavascriptTimestampTest.swift
//  CoreTests
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import XCTest

class DateJavascriptTimestampTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Arrange
        let timestamp:Double = 1508740661704
        
        // Act
        let date = Date(javascriptTimestamp: timestamp)
        
        // Assert
        XCTAssertTrue(date.javascriptTimestamp == timestamp)
    }
}
