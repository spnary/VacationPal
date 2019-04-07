//
//  ResortStayDetailViewModelTests.swift
//  VacationPalTests
//
//  Created by Stephen Nary on 4/7/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import XCTest
@testable import VacationPal

class ResortStayDetailViewModelTests: XCTestCase {
    
    let stay = try! ResortStay(checkIn: DateComponents(year: 2020, month: 3, day: 8), checkOut: DateComponents(year: 2020, month: 3, day: 12))
    
    
    func testCheckInDate_Format_en_US() {
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: dateFormatterForTests())
        XCTAssertEqual(viewModel.checkIn, "Sunday, March 8, 2020")
    }
    
    func testCheckInDate_Format_en_GB() {
        let formatter = dateFormatterForTests(locale: Locale(identifier: "en_GB"))
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: formatter)
        XCTAssertEqual(viewModel.checkIn, "Sunday, 8 March 2020")
    }
    
    func testCheckOutDate_Format_en_US() {
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: dateFormatterForTests())
        XCTAssertEqual(viewModel.checkOut, "Thursday, March 12, 2020")
    }
    
    func testCheckOutDate_Format_en_GB() {
        let formatter = dateFormatterForTests(locale: Locale(identifier: "en_GB"))
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: formatter)
        XCTAssertEqual(viewModel.checkOut, "Thursday, 12 March 2020")
    }
    
    func testNights() {
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: dateFormatterForTests())
        XCTAssertEqual(viewModel.nights, "4")
    }
    
    func test11MonthWindow() {
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: dateFormatterForTests())
        XCTAssertEqual(viewModel.elevenMonthWindow, "Monday, April 8, 2019")
    }
    
    func test11MonthWindow_GB() {
        let formatter = dateFormatterForTests(locale: Locale(identifier: "en_GB"))
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: formatter)
        XCTAssertEqual(viewModel.elevenMonthWindow, "Monday, 8 April 2019")
    }
    
    func test7MonthWindow() {
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: dateFormatterForTests())
        XCTAssertEqual(viewModel.sevenMonthWindow, "Thursday, August 8, 2019")
    }
    
    func test7MonthWindow_GB() {
        let formatter = dateFormatterForTests(locale: Locale(identifier: "en_GB"))
        let viewModel = ResortStayDetailViewModel(stay: stay, formatter: formatter)
        XCTAssertEqual(viewModel.sevenMonthWindow, "Thursday, 8 August 2019")
    }
    
    func dateFormatterForTests(locale: Locale = Locale(identifier: "en_US")) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        return formatter
    }

}
