//
//  ContentView.swift
//  Assignment15
//
//  Created by Rahul Adepu on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            TabView {
                ZStackView()
                    .tabItem {
                        Image(systemName: "square.2.layers.3d.top.filled")
                        Text("Zstack")
                    }
                WebView()
                    .tabItem {
                        Image(systemName: "globe")
                        Text("Web")
                    }
                GeometricReaderView()
                    .tabItem {
                        Image(systemName: "circle.square")
                        Text("Geometric")
                    }
                SwiftUIToUIKitView()
                    .tabItem {
                        Image(systemName: "square.and.arrow.up")
                        Text("SwiftUI to UIKit")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
