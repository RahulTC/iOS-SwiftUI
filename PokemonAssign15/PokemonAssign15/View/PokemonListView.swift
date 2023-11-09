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
                List(pokemonViewModel.pokemonList){ pokemon in
                    NavigationLink {
                        DetailView(pokemon: pokemon)
                    } label: {
                        PokemonListCellView(pokemon: pokemon)
                            .padding(.vertical, 5)
                    }
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
            }
            .padding()
            .onAppear{
                Task{
                    await pokemonViewModel.getAPIData()
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        PokemonListView()
    }
}


struct DetailView: View {
    
    var pokemon: PokemonData
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .frame(width: 350, height: 493.5)
                    .foregroundStyle(Color.white)
                    .shadow(radius: 10, x: 0, y: 3)
                AsyncImage(url: URL(string: pokemon.images.large)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 493.5)
                        
                } placeholder: {
                    ProgressView()
                }
            }
            .padding()
        }
    }
}
