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
    var name: String?
    var surname: String?
    var expense: Int?
    
    
    static let shared =  User()
}
