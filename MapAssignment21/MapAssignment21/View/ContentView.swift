//
//  ContentView.swift
//  MapAssignment21
//
//  Created by Rahul Adepu on 12/4/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject var usersViewModel = UsersViewModel()
    @State var isErrorOccurred:Bool = false
    
    var body: some View {
        NavigationStack {
            if let region = usersViewModel.region {
                /*
                 Error - Cannot convert value of type 'MKCoordinateRegion' to expected argument type 'Binding<MKCoordinateRegion>'
                 
                 To deal with this error I had to use .constant()
                 */
                Map(coordinateRegion: .constant(region),
                    annotationItems: usersViewModel.filteredUsersList) { user in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double(user.address.geo.lat) ?? 0.0,
                                                                     longitude: Double(user.address.geo.lng) ?? 0.0))
                    {
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            CustomPin(title: user.address.street)
                        }
                    }
                }
            } else {
                // Default View
                Text("Loading Map...")
                    .onAppear {
                        usersViewModel.getAPIData(urlString: Constant.userListEndpoint)
                        if usersViewModel.customError != nil {
                            isErrorOccurred = true
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

