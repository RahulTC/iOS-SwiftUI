//
//  PlanetViewModel.swift
//  CombineAssignment18
//
//  Created by Rahul Adepu on 11/21/23.
//

import Foundation
import Combine

class PlanetViewModel: ObservableObject {
    
    var planetList = [Planet]()
    @Published var filteredPlanetList = [Planet]()
    @Published var customError:NetworkError?
    var manager:NetworkProtocol
    var cancellable = Set<AnyCancellable>()
    
    init(manager: NetworkProtocol = NetworkManager()){
        self.manager = manager
    }
    
    func getAPIData(urlString: String) {
            guard let url = URL(string: urlString) else {
                self.customError = NetworkError.urlError
                return
            }
            manager.getDataFromAPI(url: url, modelType: PlanetModel.self)
                .receive(on: RunLoop.main)
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
                } receiveValue: { planetList in
                    self.planetList = planetList.planet
                    self.filteredPlanetList = self.planetList.sorted(by: { $0.name > $1.name })
                }.store(in: &cancellable)

    }
    
    func cancelOngoingTask(){
        cancellable.first?.cancel()
    }
    
    func searchResultsFromPlanetList(searchText: String) {
        if searchText.isEmpty{
            self.filteredPlanetList = self.planetList.sorted(by: { $0.name > $1.name })
        }else {
            let newList = planetList.filter { planet in
                planet.name.localizedCaseInsensitiveContains(searchText)
            }
            self.filteredPlanetList = newList.sorted(by: { $0.name > $1.name })
        }
    }
}
