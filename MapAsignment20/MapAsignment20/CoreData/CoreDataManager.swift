//
//  CoreDataManager.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/28/23.
//

import Foundation
import CoreData

class CoreDataManager: CoreDataActions {
    
    func saveDataInDatabase(usersList: [User]) async throws {
        try await clearAllProductRecord()
        
        /*
         Since all the task related to CoreData is performed on the Main thread which is not always required I am moving it to a background thread using the NSPrivateQueueConcurranceType
         */
        
        //To perform the task in the background I am using container.performBackgroundTask
        try await PersistenceController.shared.container.performBackgroundTask { privateContext in
            usersList.forEach { user in
                
                let userEntity = UserEntity(context: privateContext)
                let id = UUID()
                userEntity.id = UUID()
                userEntity.name = user.name
                
                var addressEntity = [AddressEntity]()
                
            }
            do {
                try privateContext.save()
                print("Data Saved to Core Data")
            }catch{
                print(error.localizedDescription)
                throw error
            }
        }
    }
    
    func deleteDataFromDatabase(entry: UserEntity) async throws {
        await PersistenceController.shared.container.performBackgroundTask { privateContext in
            privateContext.delete(entry)
        }
    }
    
    func getDataFromDatabase() async throws -> [UserEntity] {
        try await PersistenceController.shared.container.performBackgroundTask { privateContext in
            let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
            let allRecords = try privateContext.fetch(request)
            return allRecords
        }
    }
    
    func clearAllProductRecord() async throws{
        try await PersistenceController.shared.container.performBackgroundTask { privateContext in
            let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
            let allRecords = try privateContext.fetch(request)
            allRecords.forEach { productEntity in
                privateContext.delete(productEntity)
            }
            try privateContext.save()
            print("all records Deleted")
        }
    }
}

protocol CoreDataActions{
    func saveDataInDatabase(usersList:[User]) async throws
    func deleteDataFromDatabase(entry:UserEntity) async throws
    func getDataFromDatabase() async throws -> [UserEntity]
}
