//
//  DetailSchoolAdmissionsPriority.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct DetailSchoolAdmissionsPriority: View {
    var jmpcSchool: SchoolModel
    var body: some View {
        VStack{
            // Check if the array is not nil
            if let unwrappedArray = jmpcSchool.admissionspriority {
                Text("Admissions Priority")
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
                Text("Admissions Priority not mentioned")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

#Preview {
    DetailSchoolAdmissionsPriority(jmpcSchool: Constant.previewSchoolModel[0])
}
