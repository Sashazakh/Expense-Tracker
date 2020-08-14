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
    
    init() {
        self.name = ""
        self.surname = ""
        self.expense = 0
    }
    
    init(name: String, surname: String, expense: Int) {
        self.name = name
        self.surname = surname
        self.expense = expense
    }
    
    static let shared =  User()
}
