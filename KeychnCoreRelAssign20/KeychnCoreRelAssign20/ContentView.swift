//
//  ContentView.swift
//  KeychnCoreRelAssign20
//
//  Created by Rahul Adepu on 12/4/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        VStack{
            Text("Hello")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
