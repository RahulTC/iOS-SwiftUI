//
//  FakeNetworkManager.swift
//  JMPCSchoolAppAssign17Tests
//
//  Created by Rahul Adepu on 11/15/23.
//

import Foundation
@testable import JMPCSchoolAppAssign17

class FakeNetworkManager: NetworkProtocol {
    func getDataFromAPI<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        
        let bundle = Bundle(for: FakeNetworkManager.self)
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        guard let url = url else { throw NetworkErrors.urlError }
        
        do{
            let rawData = try Data(contentsOf: url)
            if rawData.isEmpty {
                throw NetworkErrors.dataNotFound
            }
            
            do{
                let parsedData = try JSONDecoder().decode(modelType, from: rawData)
                return parsedData
            }catch{
                throw NetworkErrors.parsingError
            }
        }catch{
            print(error)
            print(error.localizedDescription)
            throw error
        }
    }
}
