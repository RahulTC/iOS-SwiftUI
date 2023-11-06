//
//  ListScreen.swift
//  FirstSwiftUIApp
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct ListScreen: View {
    
    private var weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    private var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    var body: some View {
        VStack {
            Text("Hello")
            List (weekDays, id:\.self){ day in
                Text(day)
            }
            
            List{
                Text("1")
                Text("2")
                Text("3")
            }
            
            List {
                ForEach(weekDays, id:\.self){ day in
                    Text(day)
                }
            }
        }
    }
}

#Preview {
    ListScreen()
}
