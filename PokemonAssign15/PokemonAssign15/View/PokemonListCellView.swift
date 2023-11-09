//
//  PokemonListCellView.swift
//  PokemonAssign15
//
//  Created by Rahul Adepu on 11/8/23.
//

import SwiftUI

struct PokemonListCellView: View {
    
    var pokemon: PokemonData
    
    var body: some View {
        HStack{
            ZStack{
                Rectangle()
                    .frame(width: 100, height: 141)
                    .foregroundStyle(Color.white)
                    .shadow(radius: 10, x: 0, y: 3)
                AsyncImage(url: URL(string: pokemon.images.small)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 141)
                        
                } placeholder: {
                    ProgressView()
                }
            }
            .padding()
            
            VStack {
                HStack {
                    HStack(alignment: .bottom, spacing:0){
                        Text("id")
                            .font(.system(size: 12))
                        Text("\(pokemon.nationalPokedexNumbers[0])")
                    }
                    Spacer()
                    HStack(alignment: .bottom, spacing:0){
                        Text("HP")
                            .font(.system(size: 12))
                        Text(pokemon.hp ?? "0")
                    }
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text(pokemon.name)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
            }
            .padding(10)
            .frame(height: 141)
            .frame(maxWidth: .infinity)
            .padding(.trailing, 20)
        }
        .frame(height: 175)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 15, style: .continuous))
        .shadow(color: .black.opacity(0.4), radius: 8, x: 5, y: 8)
    }
}

#Preview {
    PokemonListCellView(pokemon: Constant.previewPokemon[0])
}
