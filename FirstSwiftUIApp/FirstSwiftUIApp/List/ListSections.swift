//
//  ListSections.swift
//  FirstSwiftUIApp
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct ListSections: View {
    private var weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    private var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    var body: some View {
        VStack{
            List{
                Section("1st Section") {
                    ForEach(weekDays, id:\.self){ day in
                        HStack{
                            Image(systemName: "doc.on.doc.file")
                            Text(day)
                        }
//                        .onTapGesture {
//                            print(day)
//                        }
                    }
                }
                
                Section("2nd Section") {
                    ForEach(months, id:\.self){ month in
                        HStack{
                            Image(systemName: "doc.on.doc.file")
                            Text(month)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ListSections()
}
