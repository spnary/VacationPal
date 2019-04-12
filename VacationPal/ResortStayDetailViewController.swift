//
//  ResortStayDetailViewController.swift
//  VacationPal
//
//  Created by Stephen Nary on 4/2/19.
//  Copyright © 2019 Stephen Nary. All rights reserved.
//

import UIKit

class ResortStayDetailViewController: UIViewController {
    
    @IBOutlet weak var checkInDateLabel: UILabel?
    @IBOutlet weak var checkOutDateLabel: UILabel?
    @IBOutlet weak var nightsLabel: UILabel?
    @IBOutlet weak var elevenMonthWindowLabel: UILabel?
    @IBOutlet weak var sevenMonthWindowLabel: UILabel?
    
    var viewModel: ResortStayDetailViewModel? {
        didSet {
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        checkInDateLabel?.text = viewModel?.checkIn
        checkOutDateLabel?.text = viewModel?.checkOut
        nightsLabel?.text = viewModel?.nights
        elevenMonthWindowLabel?.text = viewModel?.elevenMonthWindow
        sevenMonthWindowLabel?.text = viewModel?.sevenMonthWindow
    }

}
