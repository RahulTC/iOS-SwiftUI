//
//  FakeNetworkManager.swift
//  CombineAssignment18Tests
//
//  Created by Rahul Adepu on 11/21/23.
//

import Foundation
import Combine
@testable import CombineAssignment18

class FakeNetworkManager: NetworkProtocol {
    func getDataFromAPI<T>(url: URL, modelType: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        let bundle = Bundle(for: FakeNetworkManager.self)
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        guard let url = url else {
            return Fail(error: NetworkError.urlError).eraseToAnyPublisher()
        }
        
        do {
            let rawData = try Data(contentsOf: url)
            if rawData.isEmpty {
                return Fail(error: NetworkError.dataNotFound).eraseToAnyPublisher()
            }
            
            let parsedData = try JSONDecoder().decode(modelType.self, from: rawData)
            return Just(parsedData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }catch{
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
