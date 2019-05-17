//
//  ResortStayAddViewController.swift
//  VacationPal
//
//  Created by Stephen Nary on 4/2/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import UIKit

class ResortStayAddViewController: UIViewController {
    
    @IBOutlet weak var checkInPicker: UIDatePicker?
    @IBOutlet weak var checkOutPicker: UIDatePicker?
    
    let calendar = Calendar(identifier: .gregorian)
    var stay: ResortStay?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let tomorrow = calendar.date(byAdding: DateComponents(day: 1), to: Date()) else { return }
        checkInPicker?.minimumDate = Date()
        checkOutPicker?.minimumDate = tomorrow
        checkOutPicker?.date = tomorrow
    }
    
    @IBAction func dateUpdated(sender: UIDatePicker) {
        guard let checkIn = checkInPicker?.date,
            let checkOut = checkOutPicker?.date else { return }
        stay = stayFromDates(checkIn: checkIn, checkOut: checkOut)
    }
    
    func stayFromDates(checkIn: Date, checkOut: Date) -> ResortStay? {
        let checkInComps = calendar.dateComponents([.year, .month, .day], from: checkIn)
        let checkOutComps = calendar.dateComponents([.year, .month, .day], from: checkOut)

        return try? ResortStay(checkIn: checkInComps, checkOut: checkOutComps)
    }

}
