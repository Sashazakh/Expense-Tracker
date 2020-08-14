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
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do{
            let fetchResult = try UserCoreDataManager.shared.context.fetch(fetchRequest)
            if fetchResult.count == 0
            {
                let userEntity =  try UserEntity.create(user: user, context: self.context)
                saveContext()
                complitionHandler(userEntity)
            } else
            {
                try UserEntity.getUser(context: self.context) { (userEntity) in
                    complitionHandler(userEntity)
                }
            }
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
}
