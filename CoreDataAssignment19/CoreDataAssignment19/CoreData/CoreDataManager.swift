//
//  CoreDataManager.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/28/23.
//

import Foundation
import CoreData

class CoreDataManager: CoreDataActions {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveDataInDatabase(productsList: [Product]) async throws {
        try await clearAllRecord()
        
        productsList.forEach { products in
            
            let productsEntity = ProductEntity(context: self.context)
            
            productsEntity.id = Int32(products.id)
            productsEntity.title = products.title
            productsEntity.desc = products.description
            productsEntity.price = Int32(products.price)
            productsEntity.discountPercentage = products.discountPercentage
            productsEntity.rating = products.rating
            productsEntity.stock = Int32(products.stock)
            productsEntity.brand = products.brand
            productsEntity.category = products.category
            productsEntity.thumbnail = products.thumbnail
            productsEntity.productImages = products.images as [NSString] as NSArray
                        
        }
        do {
            try self.context.save()
            print("Data Saved to Core Data")
        }catch{
            print(error.localizedDescription)
            throw error
        }
    }
    
    func deleteDataFromDatabase(entry: ProductEntity) async throws {
        await PersistenceController.shared.container.performBackgroundTask { privateContext in
            privateContext.delete(entry)
        }
    }
    
    func getDataFromDatabase() async throws -> [ProductEntity] {
        try await PersistenceController.shared.container.performBackgroundTask { privateContext in
            let request: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
            let allRecords = try privateContext.fetch(request)
            return allRecords
        }
    }
    
    func clearAllRecord() async throws{
        try await PersistenceController.shared.container.performBackgroundTask { privateContext in
            let request: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
            let allRecords = try privateContext.fetch(request)
            allRecords.forEach { digimonEntity in
                privateContext.delete(digimonEntity)
            }
            try privateContext.save()
            print("all records Deleted")
        }
    }
}

protocol CoreDataActions{
    func saveDataInDatabase(productsList:[Product]) async throws
    func deleteDataFromDatabase(entry:ProductEntity) async throws
    func getDataFromDatabase() async throws -> [ProductEntity]
}
