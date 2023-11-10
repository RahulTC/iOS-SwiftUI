//
//  FakeNetworkManager.swift
//  PokemonAssign15Tests
//
//  Created by Rahul Adepu on 11/10/23.
//

import Foundation
@testable import PokemonAssign15

class FakeNetworkManager: NetworkProtocol {
    func getDataFromAPI<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        
        let bundle = Bundle(for: FakeNetworkManager.self)
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        guard let url = url else { throw NetworkError.urlError }
        
        do{
            let rawData = try Data(contentsOf: url)
            if rawData.isEmpty {
                throw NetworkError.dataNotFound
            }
            
            do{
                let parsedData = try JSONDecoder().decode(modelType, from: rawData)
                return parsedData
            }catch{
                throw NetworkError.parsingError
            }
        }catch{
            print(error)
            print(error.localizedDescription)
            throw error
        }
    }
}
