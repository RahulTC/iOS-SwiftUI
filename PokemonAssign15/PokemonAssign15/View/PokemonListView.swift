//
//  PokemonListView.swift
//  PokemonAssign15
//
//  Created by Rahul Adepu on 11/8/23.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject var pokemonViewModel = PokemonViewModel()
    @State var isErrorOccurred:Bool = false
        
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(pokemonViewModel.pokemonList){ pokemon in
                            PokemonListCellView(pokemon: pokemon)
                            .background(
                                NavigationLink("", destination: {
                                    DetailView(pokemon: pokemon)
                                })
                                .opacity(0))
                            .listRowInsets(.init(top: 5, leading: 20, bottom: 20, trailing: 20))
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
            }
            .task {
                await pokemonViewModel.getAPIData(urlString: Constant.pokemonListEndpoint)
                if pokemonViewModel.customError != nil {
                    isErrorOccurred = true
                }
            }
            .refreshable {
                await pokemonViewModel.getAPIData(urlString: Constant.pokemonListEndpoint)
            }
            
        }
        .alert(isPresented: $isErrorOccurred) {
            Alert(title: Text(pokemonViewModel.customError?.localizedDescription ?? ""),
                  message: Text("Try Again"),
                  dismissButton: .default(Text("Okay")))
        }
    }
}

#Preview {
    NavigationStack{
        PokemonListView()
    }
}



