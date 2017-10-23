//
//  DateFormatterHelpTest.swift
//  CoreTests
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import XCTest

class DateFormatterHelpTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDateToStringLocalized() {
        // Arrange
        let inputDate = "12 enero 2017"
        let locale = Locale(identifier: "es")
        
        // Act
        let date = DateFormatter.shared.date(fromString: inputDate, withFormat: "dd MMMM yyyy", locale: locale)!
        let stringDate = DateFormatter.shared.string(fromDate: date, withFormat: "dd/MM/yyy")
        
        // Assert
        XCTAssertTrue(stringDate == "12/01/2017")
    }
    
    func testDateToStringUsingTemplate() {
        // Arrange
        let inputDate = "12/01/2017"

        // Act
        let date = DateFormatter.shared.date(fromString: inputDate, withFormat: "dd/MM/yyyy")!
        let locale = Locale(identifier: "en_US")
        let stringDate = DateFormatter.shared.string(fromDate: date, usingTemplate: "ddMMyyyy", locale: locale)
        
        // Assert
        XCTAssertTrue(stringDate == "01/12/2017")
    }
    
    func testStringToDateUsingTemplate() {
        // Arrange
        let inputDate = "01/12/2017"
        let locale = Locale(identifier: "en_US")
        
        // Act
        let date = DateFormatter.shared.date(fromString: inputDate, usingTemplate: "ddMMyyy", locale: locale)!
        let stringDate = DateFormatter.shared.string(fromDate: date, withFormat: "dd-MM-yyyy")
        
        // Assert
        XCTAssertTrue(stringDate == "12-01-2017")
    }
    
    func testStringToDateUsingTemplateWithDeviceLocation() {
        // Arrange
        let inputDate = "01/12/2017"
        
        // Act
        let date = DateFormatter.shared.date(fromString: inputDate, usingTemplate: "ddMMyyyy")!
        let stringDate = DateFormatter.shared.string(fromDate: date, usingTemplate: "ddMMyyyy")
        
        // Assert
        XCTAssertTrue(inputDate == stringDate)
    }
}
