//
//  KeychainViewModel.swift
//  KeychnCoreRelAssign20
//
//  Created by Rahul Adepu on 12/4/23.
//

import Foundation

class KeychainViewModel: ObservableObject{
    
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
