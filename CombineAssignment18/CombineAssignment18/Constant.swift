//
//  Constant.swift
//  CombineAssignment18
//
//  Created by Rahul Adepu on 11/21/23.
//

import Foundation

struct Constant {
    static let planetListEndpoint = "https://swapi.dev/api/planets/?format=json"
    
    static let previewPlanet: [Planet] = [
        Planet(name: "Helo", climate: "Rainy", population: "12345")
        
    ]
}
