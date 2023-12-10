//
//  UserModel.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/30/23.
//

import SwiftUI

// MARK: - User
struct User: Decodable, Identifiable {
    var id: Int
    var name, username, email: String
    var address: Address
    var phone, website: String
    var company: Company
}

// MARK: - Address
struct Address: Decodable {
    var street, suite, city, zipcode: String
    var geo: Geo
}

// MARK: - Geo
struct Geo: Decodable {
    var lat, lng: String
}

// MARK: - Company
struct Company: Decodable {
    var name, catchPhrase, bs: String
}
