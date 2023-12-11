//
//  UserViewModel.swift
//  MapAssignment21
//
//  Created by Rahul Adepu on 12/10/23.
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
    
    // Initializing the Products View Model with Network Manager and CoreDataManager
    init(networkManager: NetworkProtocol = NetworkManager()) {
        self.networkManager = networkManager
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
                self.filteredUsersList = self.usersList.sorted(by: { $0.name < $1.name })
                print("Something")
                self.calculateRegion(userList: self.filteredUsersList)
            }.store(in: &cancellable)
    }
    
    // Calculating the region from the list
    func calculateRegion(userList: [User]) {
        var lat = 0.0
        var lng = 0.0
        var (maxLat, maxLng, minLat, minLng) = (0.0, 0.0, 0.0, 0.0)
        
        for user in userList {
            print("Lat -",user.address.geo.lat)
            print("Lng -",user.address.geo.lng)
            print("------------------")
            if maxLat < Double(user.address.geo.lat) ?? 0.0{
                maxLat = Double(user.address.geo.lat) ?? 0.0
            }
            
            if minLat > Double(user.address.geo.lat) ?? 0.0{
                minLat = Double(user.address.geo.lat) ?? 0.0
            }
            
            if maxLng < Double(user.address.geo.lng) ?? 0.0{
                maxLng = Double(user.address.geo.lng) ?? 0.0
            }
            
            if minLng > Double(user.address.geo.lng) ?? 0.0{
                minLng = Double(user.address.geo.lng) ?? 0.0
            }
            
            lat = (maxLat + minLat)/2
            lng = (maxLng + minLng)/2
        }
        
        
        print("Max Lat = \(maxLat)")
        print("Min Lat = \(minLat)")
        print("Max Lat = \(maxLng)")
        print("Min Lat = \(minLng)")
        print("Avg Lat = \(lat)")
        print("Avg lng = \(lng)")
        print("----------------------")
        
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat,
                                                                        longitude: lng),
                                         span: MKCoordinateSpan(latitudeDelta: 5,
                                                                longitudeDelta: 5))
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
