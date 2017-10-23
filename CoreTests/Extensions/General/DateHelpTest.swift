//
//  DateHelpTest.swift
//  CoreTests
//
//  Created by Arturo Gamarra on 10/23/17.
//  Copyright © 2017 AyniGames. All rights reserved.
//

import XCTest

class DateHelpTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToday() {
        // Act
        let today = Date.today
        let todayString = today.string(withFormat: "dd/MM/yyyy HH:mm:ss")
        
        // Assert
        let isCorrect = todayString.contains("00:00:00")
        XCTAssertTrue(isCorrect)
    }
    
    func testDateToString() {
        // Arrange
        let inputDate = "2017-01-12 20:30:15"
        
        // Act
        let date = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        let stringTemplate = date.string(fromTemplate: "ddMMyyy")
        let stringFormat = date.string(withFormat: "dd-MM-yyy")
        
        // Assert
        XCTAssertTrue(stringTemplate == "01/12/2017" && stringFormat == "12-01-2017")
    }
    
    func testInvalidateConversion() {
        let date = Date(stringDate: "QWERTY", format: "dd")
        XCTAssertNil(date)
    }
    
    func testAddHourMinutesToDate() {
        // Arrange
        let inputDate = "2017-01-12 08:30:15"
        let initialDate = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        let hours = 8
        let minutes = 15
        
        // Act
        var finalDate = initialDate.date(byAddingMinutes: minutes)
        finalDate = finalDate.date(byAddingHours: hours)
        
        let resultHours = initialDate.hours(untilDate: finalDate)
        let resultMinutes = initialDate.minutes(untilDate: finalDate)
        
        // Assert
        let expectedMinutes = hours*60 + minutes
        XCTAssertTrue(hours == resultHours && expectedMinutes == resultMinutes)
    }
    
    func testAddDayMonthToDate() {
        // Arrange
        let inputDate = "2017-01-12 08:30:15"
        let initialDate = Date(stringDate: inputDate, format: "yyyy-MM-dd HH:mm:ss")!
        let days = -4
        let months = 2
        
        // Act
        let monthDate = initialDate.date(byAddingMonths: months)
        let dayDate = initialDate.date(byAddingDays: days)
        
        let resultMonths = initialDate.months(untilDate: monthDate)
        let resultDays = dayDate.days(untilDate: initialDate)
        
        // Assert
        XCTAssertTrue(resultMonths == months && resultDays == -days)
    }
}
