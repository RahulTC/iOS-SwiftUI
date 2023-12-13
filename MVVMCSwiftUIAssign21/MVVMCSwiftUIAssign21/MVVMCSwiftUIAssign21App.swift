//
//  MVVMCSwiftUIAssign21App.swift
//  MVVMCSwiftUIAssign21
//
//  Created by Rahul Adepu on 12/4/23.
//

import SwiftUI

@main
struct MVVMCSwiftUIAssign21App: App {
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(MainCoordinator())
        }
    }
}
