//
//  ContentView.swift
//  SwiftUIAppleMap
//
//  Created by Rahul Adepu on 11/22/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var userLocationManager = LocationManager()
    
    @State var staticRegion =
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.127), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    var region:Binding<MKCoordinateRegion>?{
        guard let location = userLocationManager.currentLocation else {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.127), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)).getBinding()
        }
        let actualRegion = MKCoordinateRegion(center: location.coordinate,
                                              span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        return actualRegion.getBinding()
    }
    
//    var somePlace = Place()
    
    var body: some View {
        VStack {
            // Static Location
            Map(coordinateRegion: $staticRegion)
            
            // With Current Location
//            if let region = region {
//                Map(coordinateRegion: region)
//                    .ignoresSafeArea()
//            }
            
//            if let region = region {
//                Map(coordinateRegion: region, 
//                    annotationItems: [somePlace]){ place in
//                    MapMarker(coordinate: place.coordinate)
//                    
//                }
//                .ignoresSafeArea()
//            }
            
        }
    }
}

#Preview {
    ContentView()
}
