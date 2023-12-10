//
//  UserDetailView.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/7/23.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        VStack{
            UserDetailMapView(placeName: user.address.street,
                              lat: Double(user.address.geo.lat) ?? 0.0,
                              lng: Double(user.address.geo.lng) ?? 0.0)
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
    UserDetailView(user: Constant.previewUserData[0])
}
