//
//  CardView.swift
//  Assignment15
//
//  Created by Rahul Adepu on 11/7/23.
//

import SwiftUI

struct CardView: View {
    
    var pokemonImage: String = ""
    var pokemonName: String = ""
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 250, height: 200)
                .foregroundStyle(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 10, y: 10)
            VStack{
                AsyncImage(url: URL(string: pokemonImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 225, height: 150)
                } placeholder: {
                    ProgressView()
                }
                Text(pokemonName)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    CardView()
}
