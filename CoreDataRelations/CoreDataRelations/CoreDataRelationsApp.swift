//
//  CoreDataRelationsApp.swift
//  CoreDataRelations
//
//  Created by Rahul Adepu on 12/4/23.
//

import SwiftUI

@main
struct CoreDataRelationsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
