//
//  PaymentEntity.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 21.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit
import CoreData

class PaymentEntity: NSManagedObject
{
    class func findOrCreate(payment: Payment, context: NSManagedObjectContext) throws -> PaymentEntity
    {
        let request: NSFetchRequest<PaymentEntity> = PaymentEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %s", payment.id)
        
        do
        {
            let fetchResult = try context.fetch(request)
            if fetchResult.count > 0
            {
                return fetchResult[0]
            }
        } catch
        {
            throw error
        }
        let paymentEntity = PaymentEntity(context: context)
        paymentEntity.amount = Int64(payment.amount)
        paymentEntity.date = payment.date
        paymentEntity.id = payment.id
        paymentEntity.title = payment.title
        paymentEntity.type = payment.type.rawValue
        return paymentEntity
    }
    
    func convertFromPayment(payment: Payment)
    {
        self.amount = Int64(payment.amount)
        self.id = payment.id
        self.date = payment.date
        self.title = payment.title
        self.type = payment.type.rawValue
    }
}
