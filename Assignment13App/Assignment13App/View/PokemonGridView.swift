//
//  PokemonGridView.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct PokemonGridView: View {
    
    private var gridColumns = [GridItem(), GridItem(), GridItem()]
    var pokemonListGen1:[PokemonModel] = [
        PokemonModel(name: "Bulbasaur", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F001.png&w=640&q=75"),
        PokemonModel(name: "Ivysaur", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F002.png&w=640&q=75"),
        PokemonModel(name: "Venusaur", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F003.png&w=640&q=75"),
        PokemonModel(name: "Charmander", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F004.png&w=640&q=75"),
        PokemonModel(name: "Charmeleon", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F005.png&w=640&q=75"),
        PokemonModel(name: "Charizad", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F006.png&w=640&q=75"),
        PokemonModel(name: "Squirtle", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F007.png&w=640&q=75"),
        PokemonModel(name: "Wartortle", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F008.png&w=640&q=75"),
        PokemonModel(name: "Blastoise", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F009.png&w=640&q=75")
    ]
    
    var pokemonListGen2:[PokemonModel] = [
        PokemonModel(name: "Chikorita", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F152.png&w=640&q=75"),
        PokemonModel(name: "Bayleef", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F153.png&w=640&q=75"),
        PokemonModel(name: "Meganium", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F154.png&w=640&q=75"),
        PokemonModel(name: "Cyndaquil", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F155.png&w=640&q=75"),
        PokemonModel(name: "Quilava", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F156.png&w=640&q=75"),
        PokemonModel(name: "Typhlosion", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F157.png&w=640&q=75"),
        PokemonModel(name: "Totodile", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F158.png&w=640&q=75"),
        PokemonModel(name: "Croconaw", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F159.png&w=640&q=75"),
        PokemonModel(name: "Feraligator", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F160.png&w=640&q=75")
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                Section {
                    ForEach(pokemonListGen1, id: \.self){ pokemon in
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
                    ForEach(pokemonListGen2, id: \.self){ pokemon in
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
    PokemonGridView()
}


struct GridCell: View {
    
    var pokemonImage: String
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: pokemonImage)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
            }
            
        }
    }
}

