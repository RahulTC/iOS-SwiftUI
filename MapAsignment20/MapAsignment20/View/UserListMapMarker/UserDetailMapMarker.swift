//
//  UserDetailMapMarker.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/7/23.
//

import SwiftUI
import MapKit

struct UserDetailMapMarker: View {
    
    @StateObject var usersViewModel = UsersViewModel()
    var user: User
    
    var body: some View {
        ZStack{
            if let region = usersViewModel.region {
                /*
                 Error - Cannot convert value of type 'MKCoordinateRegion' to expected argument type 'Binding<MKCoordinateRegion>'
                 
                 To deal with this error I had to use .constant()
                 */
                Map(coordinateRegion: .constant(region),
                    annotationItems: [user]) { place in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: Double(user.address.geo.lat) ?? 0.0,
                                                                 longitude: Double(user.address.geo.lng) ?? 0.0))
                }
            } else {
                // Default View
                Text("Loading Map...")
                    .onAppear {
                        usersViewModel.setRegion(lat: Double(user.address.geo.lat) ?? 0.0,
                                                 lng: Double(user.address.geo.lng) ?? 0.0,
                                                 span: 0.5)
                    }
            }
            // Adding text around the MapMarker
            Text(user.address.street)
                .foregroundColor(.black)
                .offset(x: 0, y: 10)
        }
    }
}

#Preview {
    UserDetailMapMarker(user: Constant.previewUserData[0])
}
