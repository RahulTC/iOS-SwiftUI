//
//  ThirdView.swift
//  MVVMCSwiftUIAssign21
//
//  Created by Rahul Adepu on 12/13/23.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var coordinator: MainCoordinator
    var body: some View {
        VStack{
            Text("Third Screen View")
            Button(){
                coordinator.goToFourthScreen()
            } label: {
                Text("button to fourth")
            }
        }
    }
}

#Preview {
    ThirdView()
        .environmentObject(MainCoordinator())
}
