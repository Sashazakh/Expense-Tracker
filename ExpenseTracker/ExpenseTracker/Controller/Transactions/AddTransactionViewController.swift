//
//  AddTransactionViewController.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 20.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController, UITextFieldDelegate {

    var currentType: TypeTransaction = .income
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var expenseView: UIView!
    @IBOutlet weak var incomeView: UIView!
    
    @IBOutlet weak var titleTF: UITextField!
    {
        didSet
        {
            titleTF.delegate = self
        }
    }
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var amountTF: UITextField!
    {
        didSet
        {
            amountTF.delegate = self
        }
    }
    
    private var datePicker: UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        
        expenseView.layer.cornerRadius = 15
        expenseView.clipsToBounds = true
        
        incomeView.layer.cornerRadius = 15
        incomeView.clipsToBounds = true
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTF.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(setDate), for: .valueChanged)
        
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapScreen)
        
         incomeView.backgroundColor = #colorLiteral(red: 0, green: 0.3921568627, blue: 0, alpha: 0.6977739726)
    }
   
    
    @objc func viewTapped()
    {
        view.endEditing(true)
    }
    
    @objc func setDate()
    {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy"
        
        dateTF.text = dateFormat.string(from: datePicker!.date)
        view.endEditing(true)
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func okAction(_ sender: Any) {
        if checkFields()
        {
            addPayment()
            self.dismiss(animated: true)
        }
    }
    
    func checkFields() -> Bool
    {
        var result: Bool = true
        if titleTF.text == ""
        {
            let alert: AddPaymentAlert = .fillTtile
            AlertManager.addPaymentAlert(alert: alert)
            result = false
        } else if dateTF.text == ""
        {
            let alert: AddPaymentAlert = .fillDate
            AlertManager.addPaymentAlert(alert: alert)
            result = false
        } else if amountTF.text == ""
        {
            let alert: AddPaymentAlert = .fillAmount
            AlertManager.addPaymentAlert(alert: alert)
            result = false
        }
        return result
    }
    
    func addPayment()
    {
        let payment: Payment = Payment(title: titleTF.text!, date: dateTF.text!, amount: Int(amountTF.text!)!, type: currentType)
        PaymentCoreDataManager.shared.addPayment(payment: payment)
        User.shared.addPayment(payment: payment)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func expenseAction(_ sender: Any) {
        currentType = .expense
        expenseView.backgroundColor = #colorLiteral(red: 0.5450980392, green: 0, blue: 0, alpha: 0.6986836473)
        incomeView.backgroundColor = #colorLiteral(red: 0.3678154181, green: 0.3678154181, blue: 0.3678154181, alpha: 1)
    }
    @IBAction func incomeAction(_ sender: Any) {
        currentType = .income
        incomeView.backgroundColor = #colorLiteral(red: 0, green: 0.3921568627, blue: 0, alpha: 0.6977739726)
        expenseView.backgroundColor = #colorLiteral(red: 0.3678154181, green: 0.3678154181, blue: 0.3678154181, alpha: 1)
    }
}
