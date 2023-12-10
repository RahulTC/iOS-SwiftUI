//
//  MapAsignment20App.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/4/23.
//

import SwiftUI

@main
struct MapAsignment20App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
