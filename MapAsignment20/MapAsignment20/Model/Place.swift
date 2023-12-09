//
//  Place.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/7/23.
//

import Foundation
import CoreLocation

struct Place: Identifiable {
    var id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
