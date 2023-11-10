//
//  DetailView.swift
//  PokemonAssign15
//
//  Created by Rahul Adepu on 11/9/23.
//

import SwiftUI

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

#Preview {
    DetailView(pokemon: Constant.previewPokemon[0])
}
