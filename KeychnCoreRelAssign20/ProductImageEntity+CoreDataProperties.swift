//
//  ProductImageEntity+CoreDataProperties.swift
//  KeychnCoreRelAssign20
//
//  Created by Rahul Adepu on 12/4/23.
//
//

import Foundation
import CoreData


extension ProductImageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductImageEntity> {
        return NSFetchRequest<ProductImageEntity>(entityName: "ProductImageEntity")
    }

    @NSManaged public var imageId: Int32
    @NSManaged public var productImage: String?
    @NSManaged public var product: ProductEntity?

}

extension ProductImageEntity : Identifiable {

}
