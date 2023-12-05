//
//  KeychnCoreRelAssign20App.swift
//  KeychnCoreRelAssign20
//
//  Created by Rahul Adepu on 12/4/23.
//

import SwiftUI

@main
struct KeychnCoreRelAssign20App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
