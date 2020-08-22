//
//  PaymentCoreDataManager.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 21.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import Foundation
import CoreData

class PaymentCoreDataManager: BaseCoreDataManager
{
    static let shared = PaymentCoreDataManager()
    
    func addPayment(payment: Payment)
    {
        do {
            let payment = try PaymentEntity.findOrCreate(payment: payment, context: self.context)
            let user = try UserEntity.getUser(context: self.context)
            user.addToPaymentEntity(payment)
            try context.save()
        } catch
        {
             fatalError("Unresolved error \(error)")
        }
    }
}
