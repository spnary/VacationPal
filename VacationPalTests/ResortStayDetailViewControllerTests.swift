//
//  ResortStayDetailViewControllerTests.swift
//  VacationPalTests
//
//  Created by Stephen Nary on 4/9/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import XCTest
@testable import VacationPal

class ResortStayDetailViewControllerTests: XCTestCase {
    var controller: ResortStayDetailViewController!
    var viewModel: ResortStayDetailViewModel!
    
    override func setUp() {
        controller = UIStoryboard(name: "ResortStays", bundle: Bundle(for: ResortStayDetailViewController.self)).instantiateViewController(withIdentifier: "ResortStayDetail") as? ResortStayDetailViewController
        _ = controller.view
        viewModel = viewModelForTesting()
        controller.viewModel = viewModel
    }
    
    func testCheckInLabelPopulated() {
        XCTAssertEqual(controller.checkInDateLabel?.text!, viewModel.checkIn)
    }
    
    func testCheckOutLabelPopulated() {
        XCTAssertEqual(controller.checkOutDateLabel?.text!, viewModel.checkOut)
    }
    
    func testNightsLabelPopulated() {
        XCTAssertEqual(controller?.nightsLabel?.text!, viewModel.nights)
    }
    
    func test11MonthWindowLabelPopulated() {
        XCTAssertEqual(controller?.elevenMonthWindowLabel?.text!, viewModel.elevenMonthWindow)
    }
    
    func test7MonthWindowLabelPopulated() {
        XCTAssertEqual(controller?.sevenMonthWindowLabel?.text!, viewModel.sevenMonthWindow)
    }
    
    func viewModelForTesting() -> ResortStayDetailViewModel {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        let stay = try! ResortStay(checkIn: DateComponents(year: 2020, month: 3, day: 8), checkOut: DateComponents(year: 2020, month: 3, day: 12))
        return ResortStayDetailViewModel(stay: stay, formatter: formatter)
    }
}
