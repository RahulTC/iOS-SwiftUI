//
//  JMPCSchoolDetailViewModel.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import Foundation

@MainActor
class JMPCSchoolDetailViewModel: ObservableObject {
    
    @Published var schoolSatList = [SchoolDetailModel]()
    @Published var customError:NetworkErrors?
    
    var manager:NetworkProtocol
    
    init(manager: NetworkProtocol = NetworkManager()){
        self.manager = manager
    }
    
    func getAPIData(urlString: String) async{
        
        do{
            guard let url = URL(string: urlString) else { throw NetworkErrors.urlError }
            let schoolSatList = try await manager.getDataFromAPI(url: url, modelType: [SchoolDetailModel].self)
            self.schoolSatList = schoolSatList
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
