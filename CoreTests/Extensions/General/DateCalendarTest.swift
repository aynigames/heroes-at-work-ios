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
    
    func testCalendarNames() {
        // Arrange
        let inputDate = "2017-10-23 08:30:15"
        let date = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        
        // Act
        let day = date.dayOrdinality
        let weekDay = date.weekDayName
        let month = date.monthName
        let year = date.year
        let fullDate = "\(weekDay), \(month) \(day) of \(year)"
        
        // Assert
        XCTAssertTrue(fullDate == "Monday, October 23rd of 2017")
    }
    
    func testCalendarShortNames() {
        // Arrange
        let inputDate = "2017-10-22 08:30:15"
        let date = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        
        // Act
        let day = date.dayOrdinality
        let weekDay = date.weekDayShortName
        let month = date.monthShortName
        let fullDate = "\(weekDay), \(day) \(month)"
        
        // Assert
        XCTAssertTrue(fullDate == "Sun, 22nd Oct")
    }
    
    func testCalendarNumbers() {
        // Arrange
        let inputDate = "2017-10-21 08:30:15"
        let date = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        
        // Act
        let day = date.dayOrdinality
        let weekDay = date.weekDay
        let month = date.month
        
        // Assert
        XCTAssertTrue(day == "21st" && weekDay == 7 && month == 10)
    }
    
    func testDayOrdinal() {
        // Arrange
        let inputDate = "2017-10-12 08:30:15"
        let date = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        
        // Act
        let day = date.dayOrdinality
        
        // Assert
        XCTAssertTrue(day == "12th")
    }
    
    func testDaysInMonth() {
        // Arrange
        let inputDate = "2017-01-12 08:30:15"
        let date = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        
        // Act
        let days = date.daysInMonth

        // Assert
        XCTAssertTrue(days == 31)
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
