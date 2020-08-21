//
//  Transaction.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 21.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import Foundation



class Transaction
{
    var title: String
    var date: String
    var amount: Int
    var place: String?
    var type: TypeTransaction
    
    init() {
        self.title = ""
        self.date = ""
        self.amount = 0
        self.place = ""
        self.type = .income
    }

}


enum TypeTransaction
{
    case expense
    case income
}
