//
//  ContentView.swift
//  CombineAssignment18
//
//  Created by Rahul Adepu on 11/20/23.
//

import SwiftUI
import Combine 

struct ContentView: View {
    @StateObject var planetViewModel = PlanetViewModel()
    @State var isErrorOccurred:Bool = false
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                if planetViewModel.filteredPlanetList.isEmpty{
                    Button("Cancel API"){
                        planetViewModel.cancelOngoingTask()
                    }
                }else{
                    List {
                        ForEach(planetViewModel.filteredPlanetList){ planet in
                            Text(planet.name)
                                .background(
                                    NavigationLink("", destination: {
                                        DetailView(planet: planet)
                                    })
                                    .opacity(0))
                                .listRowInsets(.init(top: 5, leading: 20, bottom: 20, trailing: 20))
                                .listRowSeparator(.hidden)
                        }
                    }
                    .searchable(text: $searchText, placement: .automatic, prompt: "Search Planet")
                    .onChange(of: searchText) { oldValue, newValue in
                        planetViewModel.searchResultsFromPlanetList(searchText: newValue)
                    }
                    .listStyle(PlainListStyle())
                    .scrollIndicators(.hidden)
                }
            }
            .onAppear {
                planetViewModel.getAPIData(urlString: Constant.planetListEndpoint)
                if planetViewModel.customError != nil {
                    isErrorOccurred = true
                }
            }
            .refreshable {
                planetViewModel.getAPIData(urlString: Constant.planetListEndpoint)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
