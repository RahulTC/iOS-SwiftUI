//
//  CoreDataAssignment19App.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/22/23.
//

import SwiftUI

@main
struct CoreDataAssignment19App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
