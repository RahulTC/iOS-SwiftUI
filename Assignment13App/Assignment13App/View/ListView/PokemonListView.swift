//
//  PokemonListView.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct PokemonListView: View {
    
    var body: some View {
        NavigationStack{
//            VStack{
                List {
                    Section {
                        ForEach(PokemonData.pokemonListGen1, id:\.self){ pokemon in
                            NavigationLink{
                                PokemonDetailView(pokemonImage: pokemon.img, pokemonName: pokemon.name)
                            } label: {
                                listCell(pokemonImage: pokemon.img, pokemonName: pokemon.name)
                            }
                        }
                    } header: {
                        Text("Gen 1")
                            .modifier(SectionHeaderDesign1())
                    }
                    Section {
                        ForEach(PokemonData.pokemonListGen2, id:\.self){ pokemon in
                            NavigationLink{
                                PokemonDetailView(pokemonImage: pokemon.img, pokemonName: pokemon.name)
                            } label: {
                                listCell(pokemonImage: pokemon.img, pokemonName: pokemon.name)
                            }
                        }
                    } header: {
                        Text("Gen 2")
                            .modifier(SectionHeaderDesign1())
                    }
                }
//            }
        }
    }
}

#Preview {
    PokemonListView()
}

struct listCell: View {
    
    var pokemonImage: String
    var pokemonName: String
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: pokemonImage)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            
            Text(pokemonName)
                .font(.headline)
                .padding(.leading, 8)
        }
    }
}
