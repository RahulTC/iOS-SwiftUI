//
//  PokemonViewModel.swift
//  PokemonAssign15
//
//  Created by Rahul Adepu on 11/8/23.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    var networkManager = NetworkManager()
    @Published var pokemonList = [PokemonData]()
    
    func getAPIData() async{
        do{
            print("Trying to get the data")
            let pokemonList = try await networkManager.getDataFromAPI(url: URL(string: Constant.pokemonListEndpoint)!, modelType: PokemonModel.self)
            print(pokemonList)
            DispatchQueue.main.async {
                self.pokemonList = pokemonList.data
                
            }
        }catch{
            print(error.localizedDescription)
        }
    }
}
