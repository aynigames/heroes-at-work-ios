//
//  DateCalendarTest.swift
//  CoreTests
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import XCTest

class DateCalendarTest: XCTestCase {
    
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
        let date = Date()
        let locale = Locale(identifier: "es")
        
        // Act
        
        let monthName = date.monthName
        let esMonthName = date.monthName(forLocale: locale)
        
        let weekDayName = date.weekDayShortName
        let esweekDayName = date.weekDayShortName(forLocale: locale)
        
        let date2 = Date(stringDate: "10/01/2017", format: "dd/MM/yyyy")
        let days = date.days(untilDate: date2!)
        XCTAssertNotNil(date)
        
    }
    
    func testNumberOfDaysForMonthAtYear() {
        // Arrange
        let month = 2
        let year = 2020
     
        // Act
        let days = Date.numberOfDays(inMonth: month, ofYear: year)
        
        // Assert
        XCTAssertTrue(days == 29)
    }
}
