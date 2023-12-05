//
//  ProductModel.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/30/23.
//

import SwiftUI

// Main Product Model
struct ProductModel: Decodable {
    var products: [Product]
    var total, skip, limit: Int
}

// Product
struct Product: Decodable, Identifiable {
    var id: Int
    var title, description: String
    var price: Int
    var discountPercentage, rating: Double
    var stock: Int
    var brand, category: String
    var thumbnail: String
    var images: [String]
}
