//
//  DetailSchoolRequirement.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct DetailSchoolRequirement: View {
    var jmpcSchool: SchoolModel
    var body: some View {
        VStack{
            // Check if the array is not nil
            if let unwrappedArray = jmpcSchool.requirement {
                Text("Requirements")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.bottom, 15)
                    .minimumScaleFactor(0.5)
                
                List {
                    ForEach(unwrappedArray, id: \.self) { item in
                        Text(item)
                    }
                }
            } else {
                // Display a message if the array is nil
                Text("Requirements not mentioned")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

#Preview {
    DetailSchoolRequirement(jmpcSchool: Constant.previewSchoolModel[0])
}
