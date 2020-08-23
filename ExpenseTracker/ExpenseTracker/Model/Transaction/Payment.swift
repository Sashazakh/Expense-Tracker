//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 21.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import Foundation



class Payment
{
    var id: String
    var title: String
    var date: String
    var amount: Int
    var type: TypeTransaction
    var detail: String?
    
    init(title: String, date: String, amount: Int, type: TypeTransaction, detail: String?) {
        self.title = title
        self.date = date
        self.amount = amount
        self.type = type
        self.id = UUID().uuidString
        self.detail = detail
    }

    class func convertToPaymentArray(entities: [PaymentEntity]) -> [Payment]
    {
        var payments: [Payment] = []
        for entity in entities
        {
            payments.append(convertToPayment(entity: entity))
        }
        return payments
    }
    
    class func convertToPayment(entity: PaymentEntity) -> Payment
    {
        return Payment(title: entity.title ?? "", date: entity.date ?? "", amount: Int(entity.amount), type: TypeTransaction(rawValue: entity.type ?? "income") ?? .income, detail: entity.detail)
    }
}


enum TypeTransaction: String
{
    case expense = "expense"
    case income = "income"
}
