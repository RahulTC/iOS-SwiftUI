//
//  Network.swift
//  CombineAssignment18
//
//  Created by Rahul Adepu on 11/20/23.
//

import Foundation

protocol NetworkProtocol {
    func getDataFromAPI<T:Decodable>(url: URL, modelType:T.Type) async throws -> T
}

class NetworkManager: NetworkProtocol {
    func getDataFromAPI<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
        }catch{
            throw error
        }
    }
}
