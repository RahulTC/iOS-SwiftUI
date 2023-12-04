//
//  NetworkManager.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/27/23.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func getDataFromAPI<T:Decodable>(url: URL, modelType:T.Type) -> AnyPublisher<T, Error>
}

class NetworkManager: NetworkProtocol {
    func getDataFromAPI<T>(url: URL, modelType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
//            .delay(for: .seconds(5.0), scheduler: DispatchQueue.main) // To add a delay of 5 seconds before loading the data on the view
            .map{ $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
