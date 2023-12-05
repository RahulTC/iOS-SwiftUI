//
//  CoreDataManager.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/28/23.
//

import Foundation
import CoreData

class CoreDataManager: CoreDataActions {
    
    func saveDataInDatabase(productsList: [Product]) async throws {
        try await clearAllProductRecord()
        try await clearAllProductImageRecord()
        
        /*
         Since all the task related to CoreData is performed on the Main thread which is not always required I am moving it to a background thread using the NSPrivateQueueConcurranceType
         */
        
        //To perform the task in the background I am using container.performBackgroundTask
        try await PersistenceController.shared.container.performBackgroundTask { privateContext in
            productsList.forEach { products in
                
                let productsEntity = ProductEntity(context: privateContext)
                
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
                
                var productImageEntities = [ProductImageEntity]()
                products.images.forEach { imageUrl in
                    let productImageEntity = ProductImageEntity(context: privateContext)
                    productImageEntity.imageId = Int32(products.id)
                    productImageEntity.productImage = imageUrl
                    productImageEntities.append(productImageEntity)
                }
                
                productsEntity.productImages = NSSet(array: productImageEntities)
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
    
    func clearAllProductRecord() async throws{
        try await PersistenceController.shared.container.performBackgroundTask { privateContext in
            let request: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
            let allRecords = try privateContext.fetch(request)
            allRecords.forEach { productEntity in
                privateContext.delete(productEntity)
            }
            try privateContext.save()
            print("all records Deleted")
        }
    }
    
    func clearAllProductImageRecord() async throws{
        try await PersistenceController.shared.container.performBackgroundTask { privateContext in
            let request: NSFetchRequest<ProductImageEntity> = ProductImageEntity.fetchRequest()
            let allRecords = try privateContext.fetch(request)
            allRecords.forEach { productImageEntity in
                privateContext.delete(productImageEntity)
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
