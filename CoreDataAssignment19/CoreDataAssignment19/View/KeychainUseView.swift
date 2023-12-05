//
//  KeychainUseView.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/22/23.
//

import SwiftUI

struct KeychainUseView: View {
    @State var savedInfo: String = "None"
    var body: some View {
        VStack(spacing:20){
            Text(savedInfo)
            Button("Save info into KeyChain"){
                savedDataIntoKeychain(value: "123456", forKey: "myPassword")
            }
            .buttonStyle(.borderedProminent)
            
            Button("Get Infrom From Keychain") {
                savedInfo = getDataFromKeychain(forKey: "myPassword")
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    func savedDataIntoKeychain(value: String, forKey: String){
        if let rawData = value.data(using: .utf8){
            let query:[String:Any] = [
                kSecClass as String:kSecClassGenericPassword,
                kSecAttrAccount as String: forKey,
                kSecValueData as String: rawData
            ]
            SecItemAdd(query as CFDictionary, nil)
            print("Data Saved into Keychain")
        }
    }
    
    // To get the data back from Apple's Keychain
    func getDataFromKeychain(forKey: String) -> String {
        let query:[String:Any] = [
            kSecClass as String:kSecClassGenericPassword,
            kSecAttrAccount as String: forKey,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var dataTypeRef:AnyObject?
        // CF - stands for Core Foundation (CFDictionary)
        // NS - stands for Name Space ()
        let status:OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == noErr {
            if let data = dataTypeRef as? Data,
               let result = String(data: data, encoding: .utf8){
                print("\(result) = Got data from Keychain")
//                savedInfo = result
                return result
            }
        }
        return "Error getting Value"
    }
}

#Preview {
    KeychainUseView()
}
