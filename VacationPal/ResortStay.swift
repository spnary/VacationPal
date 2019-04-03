//
//  ResortStay.swift
//  VacationPal
//
//  Created by Stephen Nary on 3/3/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import Foundation

struct ResortStay {
    let checkIn: Date
    let checkOut: Date
    var nights: Int {
        let days =  calendar.dateComponents([.day], from: checkIn, to: checkOut)
        return days.day ?? 0
    }
    
    private let calendar = Calendar(identifier: .gregorian)
    
    init(checkIn: DateComponents, checkOut: DateComponents)  throws {
        guard checkIn.year != nil else {
            throw ResortStayError.missingCheckInYear
            
        }
        guard checkIn.month != nil else {
            throw ResortStayError.missingCheckInMonth
        }
        guard checkIn.day != nil else {
            throw ResortStayError.missingCheckInDay
        }
        guard checkOut.year != nil else {
            throw ResortStayError.missingCheckOutYear
        }
        guard checkOut.month != nil else {
            throw ResortStayError.missingCheckOutMonth
        }
        guard checkOut.day != nil else {
            throw ResortStayError.missingCheckOutDay
        }
        guard let checkInDate = calendar.date(from: checkIn) else {
            throw ResortStayError.invalidCheckInDate
        }
        guard let checkOutDate = calendar.date(from: checkOut) else {
            throw ResortStayError.invalidCheckOutDate
        }
        guard checkInDate < checkOutDate else {
            throw ResortStayError.invalidStay
        }
        self.checkIn = checkInDate
        self.checkOut = checkOutDate
        
        guard self.nights > 0 else {
            throw ResortStayError.stayTooShort
        }
    }

}

extension ResortStay {
    func bookingWindow11Months() -> Date? {
        return calendar.date(byAdding: DateComponents(month: -11), to: checkIn)
    }
    
    func bookingWindow7Months() -> Date? {
        return calendar.date(byAdding: DateComponents(month: -7), to: checkIn)
    }
}

enum ResortStayError: Error {
    case invalidStay
    case missingCheckInYear
    case missingCheckInMonth
    case missingCheckInDay
    case missingCheckOutYear
    case missingCheckOutMonth
    case missingCheckOutDay
    case invalidCheckInDate
    case invalidCheckOutDate
    case stayTooShort
    
    var localizedDescription: String {
        switch self {
        case .invalidStay:
            return "Invalid Check Out Date: Check Out date must be later than Check In date"
        case .missingCheckInYear:
            return "Missing value for Check In year"
        case .missingCheckInMonth:
            return "Missing value for Check In month"
        case .missingCheckInDay:
            return "Missing value for Check In day"
        case .missingCheckOutYear:
            return "Missing value for Check Out day"
        case .missingCheckOutMonth:
            return "Missing value for Check Out month"
        case .missingCheckOutDay:
            return "Missing value for Check Out day"
        case .invalidCheckInDate:
            return "Invalid Check In date"
        case .invalidCheckOutDate:
            return "Invalid Check Out date"
        case .stayTooShort:
            return "Stay too short: Stay must be at least one night"
        }
    }
}
