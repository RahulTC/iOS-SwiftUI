//
//  GeometricReaderView.swift
//  Assignment15
//
//  Created by Rahul Adepu on 11/7/23.
//

import SwiftUI

struct GeometricReaderView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                ForEach(PokemonData.pokemonListGen1, id:\.self){ pokemon in
                    GeometryReader { geo in
                        CardView(pokemonImage: pokemon.img, pokemonName: pokemon.name)
                            .rotation3DEffect(
                                Angle(degrees: getPercentageOfDistance(geo: geo) * 25),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 250, height: 225)
                    .padding()
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    
    func getPercentageOfDistance(geo: GeometryProxy) -> Double {
        let maxDistace = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistace))
    }
}

#Preview {
    GeometricReaderView()
}
