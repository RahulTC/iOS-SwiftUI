//
//  UserDetailView.swift
//  MapAssignment21
//
//  Created by Rahul Adepu on 12/11/23.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var body: some View {
        VStack{
            Text(user.name)
            Text(user.email)
            Text(user.username)
        }
    }
}

#Preview {
    UserDetailView(user: Constant.previewUserData[0])
}
