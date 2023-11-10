//
//  NaviagtionSplitView.swift
//  SplitViewAssign15
//
//  Created by Rahul Adepu on 11/8/23.
//

import SwiftUI

struct NaviagtionSplitViewView: View {
    private let monthArray = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
    @State var selectedItem:String?
    
    var body: some View {
        NavigationSplitView {
            List(monthArray, id: \.self, selection: $selectedItem ) { month in
                Text(month)
            }
        } detail: {
            
            // By Default it will start with the first item in the List
            Text(selectedItem ?? monthArray[0])
                    .font(.system(size: 86,
                                  weight: .heavy,
                                  design: .default))
        }

    }
}

#Preview {
    NaviagtionSplitViewView()
}
