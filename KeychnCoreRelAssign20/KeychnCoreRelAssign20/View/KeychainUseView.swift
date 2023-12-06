//
//  KeychainUseView.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/22/23.
//

import SwiftUI

struct KeychainUseView: View {
    @StateObject var keychainViewModel = KeychainViewModel()
    
    @State var savedInfo: String = "None"
    var body: some View {
        VStack(spacing:20){
            Text(savedInfo)
            Button("Save info into KeyChain"){
                keychainViewModel.savedDataIntoKeychain(value: "123456", forKey: "myPassword")
            }
            .buttonStyle(.borderedProminent)
            
            Button("Get Infrom From Keychain") {
                savedInfo = keychainViewModel.getDataFromKeychain(forKey: "myPassword")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    KeychainUseView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
