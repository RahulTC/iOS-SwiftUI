//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var emailString: String
    
    var body: some View {
        
        /* VStack
         - VStack is for vertically stacking all the items that is from top to bottom
         Hstack
         - HStack is for horizontalling stacking all the items that is from right to left
         */
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.title)
                .foregroundStyle(.red)
            TextField("Email ID", text: $emailString)
        }
        .padding()
    }
}

#Preview {
    @State var email = ""
    return ContentView(emailString: email)
}
