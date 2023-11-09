//
//  ContentView.swift
//  SplitViewAssign15
//
//  Created by Rahul Adepu on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                // Navigation Split View
                NavigationLink {
                    NaviagtionSplitViewView()
                } label: {
                    Text("Navigation Split View")
                        .modifier(ButtonDesign1())
                }
                .padding(.bottom, 150)
                
                // Property Wrapper
                NavigationLink {
                    NaviagtionSplitViewView()
                } label: {
                    Text("Property Wrapper")
                        .modifier(ButtonDesign1())
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct ButtonDesign1: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundStyle(Color.white)
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color.red.opacity(0.8))
            .clipShape(
                RoundedRectangle(cornerRadius: 35, style: .continuous))
            .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 15)
            .padding(.horizontal, 100)
    }
}
