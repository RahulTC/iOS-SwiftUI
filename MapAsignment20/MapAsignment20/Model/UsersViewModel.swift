//
//  UsersViewModel.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/30/23.
//

import Foundation
import Combine
import MapKit

class UsersViewModel: ObservableObject{
    var usersList = [User]()
    @Published var filteredUsersList = [User]()
    
    @Published var customError: NetworkError?
    @Published var region: MKCoordinateRegion?
    var cancellable = Set<AnyCancellable>()
    
    var networkManager:NetworkProtocol
    var coreDataManager:CoreDataActions
    
    // Initializing the Products View Model with Network Manager and CoreDataManager
    init(networkManager: NetworkProtocol = NetworkManager(),
         coredataManager: CoreDataActions = CoreDataManager()) {
        self.networkManager = networkManager
        self.coreDataManager = coredataManager
        getSqlitePath()
    }
    
    func getAPIData(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.customError = NetworkError.urlError
            return
        }
        networkManager.getDataFromAPI(url: url, modelType: [User].self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("Sink Failure Desc -", error.localizedDescription)
                    print(error)
                    switch error {
                    case is URLError:
                        return self.customError = NetworkError.urlError
                    case is DecodingError:
                        return self.customError = NetworkError.parsingError
                    case NetworkError.dataFormat:
                        return self.customError = NetworkError.dataFormat
                    case NetworkError.serverNotFound:
                        return self.customError = NetworkError.serverNotFound
                    default:
                        return self.customError = NetworkError.dataNotFound
                    }
                }
            } receiveValue: { usersList in
                self.usersList = usersList
//                Task{
//                    try await self.coreDataManager.saveDataInDatabase(usersList: usersList)
//                }
                self.filteredUsersList = self.usersList.sorted(by: { $0.name < $1.name })
            }.store(in: &cancellable)
        
    }
    
    func cancelOngoingTask(){
        cancellable.first?.cancel()
    }
    
    func searchResultsFromFilteredList(searchText: String) {
        if searchText.isEmpty{
            self.filteredUsersList = self.usersList.sorted(by: { $0.name < $1.name })
        }else {
            let newList = usersList.filter ({ user in
                user.name.localizedCaseInsensitiveContains(searchText)
            })
            self.filteredUsersList = newList.sorted(by: { $0.name < $1.name })
        }
    }
    
    func getSqlitePath() {
        guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return
        }
        
        let sqlPath = url.appendingPathComponent("MapAsignment20")
        print(sqlPath)
    }
    
    func setRegion(lat: Double, lng: Double, span: Double) {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat,
                                                                        longitude: lng),
                                         span: MKCoordinateSpan(latitudeDelta: span,
                                                                longitudeDelta: span))
    }
}


