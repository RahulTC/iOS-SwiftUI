//
//  DetailView.swift
//  CombineAssignment18
//
//  Created by Rahul Adepu on 11/21/23.
//

import SwiftUI

struct DetailView: View {
    var planet: Planet
    var body: some View {
        VStack{
            Text("Name: \(planet.name)")
            Text("Climate: \(planet.climate)")
            Text("Population: \(planet.population)")
        }
    }
}

#Preview {
    DetailView(planet: Constant.previewPlanet[0])
}
