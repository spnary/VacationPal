//
//  ResortStayTests.swift
//  VacationPalTests
//
//  Created by Stephen Nary on 3/3/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import XCTest
@testable import VacationPal

class ResortStayTests: XCTestCase {
    var stay: ResortStay!
    let calendar = Calendar(identifier: .gregorian)
    
    override func setUp() {
        
        
        let checkIn = DateComponents(year: 2019, month: 3, day: 14)
        let checkOut = DateComponents(year: 2019, month: 3, day: 15)
        stay = try! ResortStay(checkIn: checkIn, checkOut: checkOut)
    }
    
    func testCheckOut_LaterThanCheckIn() {
        XCTAssert(stay.checkOut > stay.checkIn)
    }
    
    func testThrowsError_WhenCheckOut_EarlierThanCheckIn() {
        let checkIn = DateComponents(year: 2019, month: 3, day: 14)
        let checkOut = DateComponents(year: 2019, month: 3, day: 13)
        XCTAssertThrowsError(try ResortStay(checkIn: checkIn, checkOut: checkOut), "Resort Stay Should Throw Error if Check Out is earlier than Check in") { error in
            XCTAssertTrue(error is ResortStayError, "ResortStay should throw a ResortStayError")
            XCTAssertEqual(error as! ResortStayError, ResortStayError.invalidStay, "ResortStay should throw an invalidStay Error if checkout is earlier than check in")
        }
    }
    
    func testTwoNightStay_Returns2() {
        let checkInComps = DateComponents(year: 2019, month: 3, day: 3)
        let twoDaysFromNow = DateComponents(year: 2019, month: 3, day:5)
        let stay = try! ResortStay(checkIn: checkInComps, checkOut: twoDaysFromNow)
        XCTAssertEqual(stay.nights, 2, "Stay should be for two nights")
    }
    
    func testThreeNightStay_Returns3() {
        let checkInComps = DateComponents(year: 2019, month: 3, day: 3)
        let threeDaysFromNow = DateComponents(year: 2019, month: 3, day:6)
        let stay = try! ResortStay(checkIn: checkInComps, checkOut: threeDaysFromNow)
        XCTAssertEqual(stay.nights, 3, "Stay should be for three nights")
    }
    
    func testMissingCheckInYearThrowsError() {
        let checkInComps = DateComponents(year: nil, month: 3, day: 14)
        let checkOutComps = DateComponents(year: 2019, month:3, day: 15)
        XCTAssertThrowsError(try ResortStay(checkIn: checkInComps, checkOut: checkOutComps)) { error in
            XCTAssertEqual(error as! ResortStayError, ResortStayError.missingCheckInYear, "A missing check in year should throw a missingCheckInYear error")
        }
    }
    
    func testMissingCheckInMonthThrowsError() {
        let checkInComps = DateComponents(year: 2019, month: nil, day: 14)
        let checkOutComps = DateComponents(year: 2019, month:3, day: 15)
        XCTAssertThrowsError(try ResortStay(checkIn: checkInComps, checkOut: checkOutComps)) { error in
            XCTAssertEqual(error as! ResortStayError, ResortStayError.missingCheckInMonth, "A missing check in year should throw a missingCheckInMonth error")
        }
    }
    
    func testMissingCheckInDayThrowsError() {
        let checkInComps = DateComponents(year: 2019, month: 3, day: nil)
        let checkOutComps = DateComponents(year: 2019, month:3, day: 15)
        XCTAssertThrowsError(try ResortStay(checkIn: checkInComps, checkOut: checkOutComps)) { error in
            XCTAssertEqual(error as! ResortStayError, ResortStayError.missingCheckInDay, "A missing check in year should throw a missingCheckInMonth error")
        }
    }
    
    func testMissingCheckOutYearThrowsError() {
        let checkInComps = DateComponents(year: 2019, month: 3, day: 14)
        let checkOutComps = DateComponents(year: nil, month:3, day: 15)
        XCTAssertThrowsError(try ResortStay(checkIn: checkInComps, checkOut: checkOutComps)) { error in
            XCTAssertEqual(error as! ResortStayError, ResortStayError.missingCheckOutYear, "A missing check in year should throw a missingCheckOutYear error")
        }
    }
    
    func testMissingCheckOutMonthThrowsError() {
        let checkInComps = DateComponents(year: 2019, month: 3, day: 14)
        let checkOutComps = DateComponents(year: 2019, month:nil, day: 15)
        XCTAssertThrowsError(try ResortStay(checkIn: checkInComps, checkOut: checkOutComps)) { error in
            XCTAssertEqual(error as! ResortStayError, ResortStayError.missingCheckOutMonth, "A missing check in year should throw a missingCheckOutMonth error")
        }
    }
    
    func testMissingCheckOutDayThrowsError() {
        let checkInComps = DateComponents(year: 2019, month: 3, day: 14)
        let checkOutComps = DateComponents(year: 2019, month:3, day: nil)
        XCTAssertThrowsError(try ResortStay(checkIn: checkInComps, checkOut: checkOutComps)) { error in
            XCTAssertEqual(error as! ResortStayError, ResortStayError.missingCheckOutDay, "A missing check in year should throw a missingCheckOutMonth error")
        }
    }
    
    func testStayLessThanOneNightThrowsError() {
        let checkInComps = DateComponents(year: 2019, month: 3, day: 14)
        let checkOutComps = DateComponents(year: 2019, month:3, day: 14, hour:1)
        XCTAssertThrowsError(try ResortStay(checkIn: checkInComps, checkOut: checkOutComps)) { error in
            XCTAssertEqual(error as! ResortStayError, ResortStayError.stayTooShort, "A Stay Too Short error should be thrown if stay is less than one night")
        }
    }

}
