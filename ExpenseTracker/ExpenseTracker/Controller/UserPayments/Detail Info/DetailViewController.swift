//
//  DetailViewController.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 23.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var payment: Payment? = nil
    
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var discreptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        configure(payment: self.payment ?? Payment())
    }
    
    private func configure(payment: Payment)
    {
        switch payment.type {
        case .expense:
            amountLabel.text = "-" + String(payment.amount) + " $"
            amountLabel.textColor = #colorLiteral(red: 0.7121817588, green: 0.151542881, blue: 0.07130336711, alpha: 1)
        case .income:
            amountLabel.text = "+" + String(payment.amount) + " $"
            amountLabel.textColor = #colorLiteral(red: 0.3338096301, green: 1, blue: 0.4874784268, alpha: 1)
        default:
            break
        }
        dateLabel.text = payment.date
        titleLabel.text = payment.title
        discreptionLabel.text = payment.detail
    }
}
