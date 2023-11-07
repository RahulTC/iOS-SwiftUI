//
//  UserPageView.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct UserPageView: View {
    
    var username: String = ""
    
    var body: some View {
        VStack{
            WelcomeMessage(username: username)
            VStack(spacing:35){
                
                NavigationLink {
                    PokemonListView()
                } label: {
                    Text("List View")
                        .modifier(ButtonDesign1())
                }
                
                NavigationLink {
                    PokemonGridView()
                } label: {
                    Text("Grid View")
                        .modifier(ButtonDesign1())
                }
                
                NavigationLink {
                    InterstingScrollView()
                } label: {
                    Text("Intersting Scroll View")
                        .modifier(ButtonDesign1())
                }
            }
            Spacer()
        }
    }
}

#Preview {
    NavigationStack{
        UserPageView()
    }
}

struct WelcomeMessage: View {
    var username: String
    var body: some View {
        VStack(spacing:0){
            Text("Welcome to the app")
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text(username)
                .foregroundStyle(Color.red.opacity(0.8))
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .fontWeight(.heavy)
                
        }
        .padding(.bottom, 100)
        .padding(.top, 50)
    }
}
