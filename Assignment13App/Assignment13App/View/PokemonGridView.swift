//
//  PokemonGridView.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct PokemonGridView: View {
    
    private var gridColumns = [GridItem(), GridItem(), GridItem()]
    
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                Section {
                    ForEach(PokemonData.pokemonListGen1, id: \.self){ pokemon in
                        NavigationLink{
                            PokemonDetailView(pokemonImage: pokemon.img, pokemonName: pokemon.name)
                        } label: {
                            GridCell(pokemonImage: pokemon.img)
                        }
                    }
                } header: {
                    Text("Gen 1")
                        .modifier(SectionHeaderDesign1())
                }
                Section {
                    ForEach(PokemonData.pokemonListGen2, id: \.self){ pokemon in
                        NavigationLink{
                            PokemonDetailView(pokemonImage: pokemon.img, pokemonName: pokemon.name)
                        } label: {
                            GridCell(pokemonImage: pokemon.img)
                        }
                    }
                } header: {
                    Text("Gen 2")
                        .modifier(SectionHeaderDesign1())
                        
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        PokemonGridView()
    }
}


struct GridCell: View {
    
    var pokemonImage: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100, height: 100)
                .foregroundStyle(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
            AsyncImage(url: URL(string: pokemonImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .padding(20)
            } placeholder: {
                ProgressView()
            }
        }
    }
}



