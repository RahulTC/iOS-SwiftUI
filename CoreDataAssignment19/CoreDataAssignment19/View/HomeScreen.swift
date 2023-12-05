//
//  HomeScreen.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/27/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 15){
                NavigationLink("CoreData Screen") {
                    ProductListView()
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}
