//
//  NetworkManager.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/11/23.
//

import SwiftUI

protocol NetworkProtocol {
    func getDataFromAPI<T:Decodable>(url: URL, modelType:T.Type) async throws -> T
}

class NetworkManager: NetworkProtocol {
    func getDataFromAPI<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        do{
            print("Inside Network Manager")
            let (data, _) = try await URLSession.shared.data(from: url)
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
        }catch{
            throw error
        }
    }
}
