//
//  SecondView.swift
//  MVVMCSwiftUIAssign21
//
//  Created by Rahul Adepu on 12/13/23.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var coordinator: MainCoordinator
    var body: some View {
        VStack{
            Text("Second Screen View")
            Button(){
                coordinator.goToThirdScreen()
            } label: {
                Text("button to third ")
            }
        }
    }
}

#Preview {
    SecondView()
        .environmentObject(MainCoordinator())
}
