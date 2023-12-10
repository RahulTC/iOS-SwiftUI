//
//  Constant.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/7/23.
//

import Foundation

struct Constant {
    static let userListEndpoint = "https://jsonplaceholder.typicode.com/users"
    
    static let previewUserData: [User] = [
        User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz",
             address: Address(street: "Kulas Light",
                              suite: "Apt. 556",
                              city: "Gwenborough",
                              zipcode: "92998-3874",
                              geo: Geo(lat: "-37.3159", lng: "81.1496")),
             phone: "1-770-736-8031 x56442",
             website: "hildegard.org",
             company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets"))
    ]
}
