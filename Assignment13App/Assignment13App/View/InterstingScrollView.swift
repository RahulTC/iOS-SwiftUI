//
//  InterstingScrollView.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct InterstingScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(0..<10){ index in
                    ScrollView(.horizontal) {
                        LazyHStack{
                            ForEach(0..<10){ index in
                                PictureView()
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                }
            }
        }
    }
}

#Preview {
    InterstingScrollView()
}

struct PictureView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 200, height: 150)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                .padding(20)
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 100)
        }
    }
}
