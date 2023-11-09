//
//  PokemonListView.swift
//  PokemonAssign15
//
//  Created by Rahul Adepu on 11/8/23.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject var pokemonViewModel = PokemonViewModel()
        
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
                await pokemonViewModel.getAPIData()
            }
            .refreshable {
                await pokemonViewModel.getAPIData()
            }
        }
    }
}

#Preview {
    NavigationStack{
        PokemonListView()
    }
}



