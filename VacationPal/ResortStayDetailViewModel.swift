//
//  ResortStayDetailViewModel.swift
//  VacationPal
//
//  Created by Stephen Nary on 4/7/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation

struct ResortStayDetailViewModel {
    
    var checkIn: String {
        return formatter.string(from: stay.checkIn)
    }
    var checkOut: String {
        return formatter.string(from: stay.checkOut)
    }
    var nights: String {
        return String(stay.nights)
    }
    var elevenMonthWindow: String {
        guard let bookingDate = stay.bookingWindow11Months() else { return "" }
        return formatter.string(from: bookingDate)
    }
    var sevenMonthWindow: String {
        guard let bookingDate = stay.bookingWindow7Months() else { return "" }
        return formatter.string(from: bookingDate)
    }
    
    private var stay: ResortStay
    private var formatter: DateFormatter
    
    init(stay: ResortStay, formatter: DateFormatter) {
        self.stay = stay
        self.formatter = formatter
    }
}
