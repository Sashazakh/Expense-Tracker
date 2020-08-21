//
//  AlertManager.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 21.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

enum AddTransactionAlert
{
    case fillTtile
    case fillDate
    case fillAmount
}



class AlertManager
{
    static func addTransactionAlert(alert: AddTransactionAlert)
    {
        switch alert {
        case .fillDate:
            showAlertMessage(title: "Attention!", message: "Plese Enter Date")
        case .fillAmount:
            showAlertMessage(title: "Attention!", message: "Plese Enter Amount Money")
        case .fillTtile:
            showAlertMessage(title: "Attention!", message: "Plese Enter Title Of The Transaction")
        default:
            break
        }
    }
    
    static func showAlertMessage(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okButton)
        
        if let topVC = UIApplication.topMostViewController
        {
            topVC.present(alert, animated: true)
        }
    }
}
