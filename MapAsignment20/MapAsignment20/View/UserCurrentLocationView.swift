//
//  UserCurrentLocationView.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/7/23.
//

import SwiftUI
import MapKit

struct UserCurrentLocationView: View {
    @StateObject var locationManager = LocationManager()
    
    @State var staticRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3346,
                                                                                longitude: -122.0090),
                                                 span: MKCoordinateSpan(latitudeDelta: 0.5,
                                                                        longitudeDelta: 0.5))
    
    var somePlace = Place(name: "place", coordinate: CLLocationCoordinate2D(latitude: 37.3346,
                                                                            longitude: -122.0090))
    
    var region: Binding<MKCoordinateRegion>?{
        guard let location = locationManager.currentLocation else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3346,
                                                                     longitude: -122.0090),
                                      span: MKCoordinateSpan(latitudeDelta: 0.5,
                                                             longitudeDelta: 0.5)).getBinding()
        }
        let actualRegion = MKCoordinateRegion(center: location.coordinate,
                                              span: MKCoordinateSpan(latitudeDelta: 0.5,
                                                                     longitudeDelta: 0.5))
        return actualRegion.getBinding()
    }
    
    var body: some View {
        VStack{
            
              // To show a static region
//            Map(coordinateRegion: $staticRegion)
            
              // To show user's current location
//            if let region = region {
//                Map(coordinateRegion: region, showsUserLocation: true)
//                    .ignoresSafeArea()
//            }
            
            // To get the pin of the some location on the map
//            if let region = region {
//            Map(coordinateRegion: region,
//                annotationItems: [somePlace]) { place in
//                MapMarker(coordinate: place.coordinate)
//            }
                
            // To put a pin the location of the user
            if let region = region {
                Map(coordinateRegion: region,
                    showsUserLocation: true,
                    annotationItems: [somePlace]) { place in
                    MapMarker(coordinate: place.coordinate)
                }
            }
        }
    }
}

#Preview {
    UserCurrentLocationView()
}
