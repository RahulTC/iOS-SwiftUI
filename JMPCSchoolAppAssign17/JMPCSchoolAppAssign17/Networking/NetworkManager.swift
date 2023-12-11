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
            let (data, _) = try await URLSession.shared.data(from: url)
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
        }catch{
            throw error
        }
    }
    
//    func getDataFromAPISchoolModel(url: String){
//        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
//          .response{ resp in
//              switch resp.result{
//                case .success(let data):
//                  do{
//                    let jsonData = try JSONDecoder().decode([SchoolModel].self, from: data!)
//                    print(jsonData)
//                 } catch {
//                    print(error.localizedDescription)
//                 }
//               case .failure(let error):
//                 print(error.localizedDescription)
//               }
//          }
//    }
    
}
