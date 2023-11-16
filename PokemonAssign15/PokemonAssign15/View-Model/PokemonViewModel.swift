//
//  PokemonViewModel.swift
//  PokemonAssign15
//
//  Created by Rahul Adepu on 11/8/23.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    
    @Published var pokemonList = [PokemonData]()
    @Published var customError:NetworkError?
    var manager:NetworkProtocol
    
    init(manager: NetworkProtocol = NetworkManager()){
        self.manager = manager
    }
    
    func getAPIData(urlString: String) async{
        
        do{
            guard let url = URL(string: urlString) else { throw NetworkError.urlError }
            let pokemonList = try await manager.getDataFromAPI(url: url, modelType: PokemonModel.self)
            self.pokemonList = pokemonList.data
        }catch{
            switch error {
            case is URLError:
                customError = NetworkError.urlError
            case is DecodingError:
                customError = NetworkError.parsingError
            case NetworkError.dataFormat:
                customError = NetworkError.dataFormat
            case NetworkError.serverNotFound:
                customError = NetworkError.serverNotFound
            default:
                customError = NetworkError.dataNotFound
            }
        }
    }
}
