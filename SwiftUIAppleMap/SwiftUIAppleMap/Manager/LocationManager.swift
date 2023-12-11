//
//  LocationManager.swift
//  SwiftUIAppleMap
//
//  Created by Rahul Adepu on 11/22/23.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

// NSObject is inheritance
// ObservableObject is a protocol
@MainActor
class LocationManager: NSObject, ObservableObject {
    @Published var currentLocation: CLLocation?
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        // What is the meaning k as the prefix?
        // for enum cases the naming convention is k
        // kCLLocationAccuracyBest is not an enum it is a typealias but usually we use k for enum cases
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        // When the user accepts to share their location then the flag is saved in the userDefaults
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.currentLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        @unknown default:
            print("Defaults")
        }
    }
}

extension MKCoordinateRegion{
    // Only SwiftUI you need this binding, but on UIKit you would not need this binding
    func getBinding()->Binding<MKCoordinateRegion>?{
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
