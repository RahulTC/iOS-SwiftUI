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
            VStack(spacing: 50){
                NavigationLink {
                    UserCurrentLocationView()
                } label: {
                    Text("Current Location View - Map Marker")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundStyle(Color.white)
                        .background(Color.red.opacity(0.6))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 5)
                }
                
                NavigationLink {
                    UserListView()
                } label: {
                    Text("User List View")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundStyle(Color.white)
                        .background(Color.red.opacity(0.6))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 5)
                }
                
                NavigationLink {
                    UserListViewMapMarker()
                } label: {
                    Text("User List View - Map Marker")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundStyle(Color.white)
                        .background(Color.red.opacity(0.6))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 5)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    HomeScreen()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
