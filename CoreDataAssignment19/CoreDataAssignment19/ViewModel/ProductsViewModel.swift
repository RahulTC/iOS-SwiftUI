//
//  ProductsViewModel.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/30/23.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject{
    var productsList = [Product]()
    @Published var filteredProductsList = [Product]()
    
    @Published var customError: NetworkError?
    var cancellable = Set<AnyCancellable>()
    
    var networkManager:NetworkProtocol
    var coreDataManager:CoreDataActions
    
    // Initializing the Products View Model with Network Manager and CoreDataManager
    init(networkManager: NetworkProtocol = NetworkManager(),
         coredataManager: CoreDataActions = CoreDataManager(context: PersistenceController.shared.container.viewContext)) {
        self.networkManager = networkManager
        self.coreDataManager = coredataManager
        getSqlitePath()
    }
    
    func getAPIData(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.customError = NetworkError.urlError
            return
        }
        networkManager.getDataFromAPI(url: url, modelType: ProductModel.self)
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
            } receiveValue: { productsList in
                self.productsList = productsList.products
                Task{
                    try await self.coreDataManager.saveDataInDatabase(productsList: productsList.products)
                }
                self.filteredProductsList = self.productsList.sorted(by: { $0.title < $1.title })
            }.store(in: &cancellable)
        
    }
    
    func cancelOngoingTask(){
        cancellable.first?.cancel()
    }
    
    func searchResultsFromFilteredList(searchText: String) {
        if searchText.isEmpty{
            self.filteredProductsList = self.productsList.sorted(by: { $0.title < $1.title })
        }else {
            let newList = productsList.filter ({ product in
                product.title.localizedCaseInsensitiveContains(searchText)
            })
            self.filteredProductsList = newList.sorted(by: { $0.title < $1.title })
        }
    }
    
    func getSqlitePath() {
        guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return
        }
        
        let sqlPath = url.appendingPathComponent("CoreDataAssignment19")
        print(sqlPath)
    }
}
