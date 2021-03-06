//
//  User.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 14.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import Foundation


class User
{
    var name: String
    var surname: String
    var expense: Int
    var balcance: Int
    var income: Int
    var payment: [Payment] = []
    
    private init() {
        self.name = ""
        self.surname = ""
        self.expense = 0
        self.balcance = 0
        self.income = 0
    }
    
    static let shared: User = {
        let instance = User()
        
        return instance
    } ()
    
    func convertEntity(entity: UserEntity)
    {
        self.name = entity.name!
        self.surname = entity.surname!
        self.expense = Int(entity.expense)
        self.income = Int(entity.income)
        self.balcance = Int(entity.balance)
        self.income = Int(entity.income)
        self.payment = Payment.convertToPaymentArray(entities: entity.payments ?? [])
    }
    
    func registerUser(name: String?, surname: String?, balance: Int?)
    {
        self.name = name ?? ""
        self.surname = surname ?? ""
        self.balcance = balance ?? 0
    }
    
    func addPayment(payment: Payment)
    {
        switch payment.type {
        case .expense:
            self.expense += payment.amount
            self.balcance -= payment.amount
        case .income:
            self.income += payment.amount
            self.balcance += payment.amount
        default:
            break
        }
        self.payment.append(payment)
    }
}
