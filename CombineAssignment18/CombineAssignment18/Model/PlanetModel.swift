//
//  PlanetModel.swift
//  CombineAssignment18
//
//  Created by Rahul Adepu on 11/21/23.
//

import Foundation

struct PlanetModel: Decodable {
    let planet: [Planet]
    
    enum CodingKeys: String, CodingKey {
        case planet = "results"
    }
}

struct Planet: Decodable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let climate: String
    let population: String
    
    enum CodingKeys: String, CodingKey {
        case name, climate, population
    }
}
