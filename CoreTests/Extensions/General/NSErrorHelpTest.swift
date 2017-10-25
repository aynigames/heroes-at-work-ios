//
//  NSErrorHelpTest.swift
//  CoreTests
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import XCTest

class NSErrorHelpTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNSErrorInit() {
        // Arrange
        let message = "An error occurres"
        
        // Act
        let error = NSError(domain: "AyniLab", code: 0, message: message)
        
        // Assert
        XCTAssertTrue(error.localizedDescription == message)
    }
    
}
