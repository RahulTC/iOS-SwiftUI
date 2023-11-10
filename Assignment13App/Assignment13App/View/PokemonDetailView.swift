//
//  PokemonDetailView.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    var pokemonImage: String = "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F001.png&w=640&q=75"
    var pokemonName: String = "Bulbasaur"
    
    var body: some View {
        VStack(spacing: 25){
            AsyncImage(url: URL(string: pokemonImage)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.6), radius: 8, x: 8, y: 8)
            } placeholder: {
                ProgressView()
            }
            Divider()
            Text(pokemonName)
                .font(.system(size: 48, weight: .heavy))
        }
    }
}

#Preview {
    PokemonDetailView()
}
