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

    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = Calendar(identifier: .gregorian)
        guard let tomorrow = calendar.date(byAdding: DateComponents(day: 1), to: Date()) else { return }
        checkInPicker?.minimumDate = Date()
        checkOutPicker?.minimumDate = tomorrow
        checkOutPicker?.date = tomorrow
    }
    

}
