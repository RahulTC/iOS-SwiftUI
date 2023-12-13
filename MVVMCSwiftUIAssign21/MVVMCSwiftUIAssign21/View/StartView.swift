//
//  StartView.swift
//  MVVMCSwiftUIAssign21
//
//  Created by Rahul Adepu on 12/13/23.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var coordinator: MainCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(page: .secondView)
                .navigationDestination(for: MyPage.self) { page in
                    coordinator.getPage(page: page)
                }
        }
    }
}

#Preview {
    StartView()
        .environmentObject(MainCoordinator())
}

