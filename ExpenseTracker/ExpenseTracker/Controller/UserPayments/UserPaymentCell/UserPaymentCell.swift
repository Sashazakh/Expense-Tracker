//
//  UserPaymentCell.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 22.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class UserPaymentCell: UITableViewCell {

    @IBOutlet weak var infoImage: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
   
    func configure(payment: Payment)
    {
        switch payment.type {
        case .expense:
            infoImage.image = UIImage(named: "ExpenseImage")
            amountLabel.text = "-" + String(payment.amount) + " $"
        case .income:
            infoImage.image = UIImage(named: "IncomeImage")
            amountLabel.text = "+" + String(payment.amount) + " $"
        default:
            break
        }
        
        titleLabel.text = payment.title
        dateLabel.text = payment.date
    }
    
}
