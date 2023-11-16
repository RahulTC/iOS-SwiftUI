//
//  DetailSchoolAcademicOpportunities.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct DetailSchoolAcademicOpportunities: View {
    var jmpcSchool: SchoolModel
    var body: some View {
        VStack{
            // Check if the array is not nil
            if let unwrappedArray = jmpcSchool.academicopportunities {
                Text("Academic Opportunities")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.bottom, 15)
                    .minimumScaleFactor(0.5)
                
                // Display a List using ForEach
                List {
                    ForEach(unwrappedArray, id: \.self) { item in
                        Text(item)
                    }
                }
            } else {
                // Display a message if the array is nil
                Text("Academic Opportunities not mentioned")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

#Preview {
    DetailSchoolAcademicOpportunities(jmpcSchool: Constant.previewSchoolModel[0])
}
