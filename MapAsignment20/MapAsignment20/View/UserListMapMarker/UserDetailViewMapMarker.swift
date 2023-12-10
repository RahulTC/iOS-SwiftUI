//
//  UserDetailViewMapMarker.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/7/23.
//

import SwiftUI

struct UserDetailViewMapMarker: View {
    var user: User
    
    var body: some View {
        VStack{
            UserDetailMapMarker(user: user)
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            
            Text(user.name)
            Text(user.email)
            Text(user.phone)
            Text(user.username)
            
            Spacer()
        }
    }
}

#Preview {
    UserDetailViewMapMarker(user: Constant.previewUserData[0])
}
