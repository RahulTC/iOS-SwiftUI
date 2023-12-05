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
                NavigationLink("Keychain Screen") {
                    KeychainUseView()
                }
                NavigationLink("CoreData Screen") {
                    ProductListView()
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
