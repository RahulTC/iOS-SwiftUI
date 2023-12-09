//
//  UserDetailMapView.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/7/23.
//

import SwiftUI
import MapKit

struct UserDetailMapView: View {
    
    var placeName: String
    var lat: Double
    var lng: Double
    
    var body: some View {
        Map() {
            Marker(placeName, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
        }
    }
}

#Preview {
    UserDetailMapView(placeName: Constant.previewUserData[0].address.street,
                      lat: Double(Constant.previewUserData[0].address.geo.lat) ?? 0.0,
                      lng: Double(Constant.previewUserData[0].address.geo.lng) ?? 0.0)
}
