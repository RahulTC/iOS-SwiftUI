//
//  MapAssignment21App.swift
//  MapAssignment21
//
//  Created by Rahul Adepu on 12/4/23.
//

import SwiftUI

@main
struct MapAssignment21App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
