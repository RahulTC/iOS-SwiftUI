//
//  ContentView.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct LoginPage: View {
    @State var username:String = ""
    @State var password:String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign in".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom, 250)
                VStack(spacing: 35) {
                    TextField("Username", text: $username)
                        .modifier(TextFieldDesign1())
                    
                    SecureField("Password", text: $password)
                        .modifier(TextFieldDesign1())
                }
                .padding(.bottom, 200)
                NavigationLink {
                    UserPageView(username: username)
                } label: {
                    Text("Sign in".uppercased())
                        .modifier(ButtonDesign1())
                }
                Spacer()
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    LoginPage()
}


