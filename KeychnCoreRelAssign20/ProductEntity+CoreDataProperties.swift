//
//  ProductEntity+CoreDataProperties.swift
//  KeychnCoreRelAssign20
//
//  Created by Rahul Adepu on 12/4/23.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var brand: String?
    @NSManaged public var category: String?
    @NSManaged public var desc: String?
    @NSManaged public var discountPercentage: Double
    @NSManaged public var id: Int32
    @NSManaged public var price: Int32
    @NSManaged public var rating: Double
    @NSManaged public var stock: Int32
    @NSManaged public var thumbnail: String?
    @NSManaged public var title: String?
    @NSManaged public var productImages: NSSet?

    
    public var unwrappedBrand: String {
        brand ?? "Unknown Brand"
    }
    
    public var unwrappedCategory: String {
        category ?? "Unknown Category"
    }
    
    public var unwrappedDesc: String {
        desc ?? "Unknown Desc"
    }
    
    public var unwrappedThumbnail: String {
        thumbnail ?? "Unknown Thumbnail"
    }
    
    public var unwrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var productImageArray: [ProductImageEntity] {
        let array = productImages as? Set<ProductImageEntity> ?? []
        
        return array.map{ $0 }
    }
    
}

// MARK: Generated accessors for productImages
extension ProductEntity {

    @objc(addProductImagesObject:)
    @NSManaged public func addToProductImages(_ value: ProductImageEntity)

    @objc(removeProductImagesObject:)
    @NSManaged public func removeFromProductImages(_ value: ProductImageEntity)

    @objc(addProductImages:)
    @NSManaged public func addToProductImages(_ values: NSSet)

    @objc(removeProductImages:)
    @NSManaged public func removeFromProductImages(_ values: NSSet)

}

extension ProductEntity : Identifiable {

}
