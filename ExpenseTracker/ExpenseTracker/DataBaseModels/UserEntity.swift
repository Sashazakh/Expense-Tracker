//
//  UserEntity.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 14.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import Foundation
import CoreData

class UserEntity: NSManagedObject
{
    var payments: [PaymentEntity]? {
        return self.paymentEntity? .array as? [PaymentEntity]
    }
    
    class func create(user: User, context: NSManagedObjectContext, _ complitionHandler: (UserEntity) -> Void) throws -> Void
    {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        
        do {
            let fetchResult = try UserCoreDataManager.shared.context.fetch(request)
            
            if fetchResult.count > 0
            {
                complitionHandler(fetchResult[0])
            }
        } catch
        {
            throw error
        }
        
        let userEntity = UserEntity(context: context)

        userEntity.convertFromUser(user: user)
        
        complitionHandler(userEntity)
    }
    
    class func getUser(context: NSManagedObjectContext) throws -> UserEntity
    {
        
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        
        var userEntity: UserEntity = UserEntity()
        do {
            let fetchResult = try context.fetch(request)
            if fetchResult.count == 1
            {
                userEntity = fetchResult[0]
            }
        } catch
        {
            throw error
        }
        return userEntity
    }
    
    class func editUser(user: User, context: NSManagedObjectContext) throws
    {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        
        do {
            let fetchResult = try UserCoreDataManager.shared.context.fetch(request)
            if fetchResult.count == 1
            {
                let userEntity = try UserEntity.getUser(context: context)
                userEntity.convertFromUser(user: user)
            }
        } catch
        {
            throw error
        }
    }
    
    func convertFromUser(user: User)
    {
        self.name = user.name
        self.surname = user.surname
        self.balance = Int64(user.balcance)
        self.income = Int64(user.income)
        self.expense = Int64(user.expense)
    }
    
    class func addPayment(payment: PaymentEntity, context: NSManagedObjectContext) throws  -> Void
    {
        do {
            let userEntiy = try UserEntity.getUser(context: context)
            userEntiy.addToPaymentEntity(payment)
        } catch
        {
            throw error
        }
    }
}
