//
//  JMPCViewModel.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/12/23.
//

import SwiftUI

@MainActor
class JMPCSchoolViewModel: ObservableObject {
    
    @Published var schoolList = [SchoolModel]()
    @Published var customError:NetworkErrors?
    
    var manager:NetworkProtocol
    
    init(manager: NetworkProtocol = NetworkManager()){
        self.manager = manager
    }
    
    func getAPIData(urlString: String) async{
        
        do{
            guard let url = URL(string: urlString) else { throw NetworkErrors.urlError }
            let schoolList = try await manager.getDataFromAPI(url: url, modelType: [SchoolModel].self)
            self.schoolList = schoolList
        }catch{
            switch error {
            case is URLError:
                customError = NetworkErrors.urlError
            case is DecodingError:
                customError = NetworkErrors.parsingError
            case NetworkErrors.dataFormat:
                customError = NetworkErrors.dataFormat
            case NetworkErrors.serverNotFound:
                customError = NetworkErrors.serverNotFound
            default:
                customError = NetworkErrors.dataNotFound
            }
        }
    }
    
    func getAPIDataUsingAlamofire(urlString: String) async {
        
        do{
            guard let url = URL(string: urlString) else { throw NetworkErrors.urlError }
            let schoolList = try await manager.getDataFromAPI(url: url, modelType: [SchoolModel].self)
            self.schoolList = schoolList
        }catch{
            switch error {
            case is URLError:
                customError = NetworkErrors.urlError
            case is DecodingError:
                customError = NetworkErrors.parsingError
            case NetworkErrors.dataFormat:
                customError = NetworkErrors.dataFormat
            case NetworkErrors.serverNotFound:
                customError = NetworkErrors.serverNotFound
            default:
                customError = NetworkErrors.dataNotFound
            }
        }
    }
    
}
