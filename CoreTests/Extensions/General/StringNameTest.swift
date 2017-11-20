//
//  StringNameTest.swift
//  CoreTests
//
//  Created by Arturo Gamarra on 11/19/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import XCTest

class StringNameTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialsHappyPath() {
        // Arrange
        let text = "Arturo Gamarra   Mejia"
        
        // Act
        let initials = text.initials
        
        // Assert
        XCTAssert(initials == "AGM")
    }
    
}
