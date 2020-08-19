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
    
    class func getUser(context: NSManagedObjectContext, _ complitionHandler: (UserEntity) -> Void) throws -> Void
    {
        
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        
        do {
            let fetchResult = try UserCoreDataManager.shared.context.fetch(request)
            
            if fetchResult.count == 1
            {
                complitionHandler(fetchResult[0])
            }
            else if fetchResult.count == 0
            {
                try self.create(user: User.shared, context: context) { (userEntity) in
                    complitionHandler(userEntity)
                }

            }
        } catch
        {
            throw error
        }
    }
    
    class func editUser(user: User, context: NSManagedObjectContext) throws
    {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        
        do {
            let fetchResult = try UserCoreDataManager.shared.context.fetch(request)
            
            if fetchResult.count == 0
            {
                try UserEntity.create(user: user, context: context, { (userEntity) in
                    userEntity.convertFromUser(user: user)
                })
            }
            else if fetchResult.count == 1
            {
                
                try UserEntity.getUser(context: context, { (userEntity) in
                    userEntity.convertFromUser(user: user)
                })
            }
        } catch
        {
            throw error
        }
    }
    
    func convertFromUser(user: User)
    {
        self.expense = Int64(user.expense)
        self.name = user.name
        self.surname = user.surname
    }
}
