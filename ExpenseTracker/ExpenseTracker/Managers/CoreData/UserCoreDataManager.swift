//
//  CoreDataManager.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 14.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import Foundation
import CoreData

class UserCoreDataManager: BaseCoreDataManager
{
    static let shared = UserCoreDataManager()
    
    func findOrCreate(user: User, _ complitionHandler: (UserEntity) -> Void)
    {
        do {
            try UserEntity.create(user: user, context: self.context) { (userEntity) in
                complitionHandler(userEntity)
            }
            saveContext()
        } catch
        {
            fatalError("Unresolved error \(error)")
        }
    }
    
    
    func isRegistered() -> Bool
    {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do{
            let fetchResult = try persistentContainer.viewContext.fetch(fetchRequest)
            if fetchResult.count == 0
            {
                return false
            } else
            {
                return true
            }
        } catch
        {
            fatalError("Unresolved error \(error)")
        }
    }
    
    func editUser(user: User)
    {
        do {
            try UserEntity.editUser(user: user, context: self.context)
            
            try context.save()
        } catch
        {
            fatalError("Unresolved error \(error)")
        }
    }
    
    func getUserEntity() -> UserEntity
    {
        do
        {
            return try UserEntity.getUser(context: self.context)
        } catch
        {
             fatalError("Unresolved error \(error)")
        }
    }
    
    func addPayment(payment: PaymentEntity)
    {
        do {
            try UserEntity.addPayment(payment: payment, context: self.context)
        } catch {
             fatalError("Unresolved error \(error)")
        }
    }
}
