//
//  DetailSchoolExtracurricularActivities.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct DetailSchoolExtracurricularActivities: View {
    var jmpcSchool: SchoolModel
    var body: some View {
        VStack{
            Text("Extracurricular Activities")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.bottom, 15)
                .minimumScaleFactor(0.5)
            
            if jmpcSchool.extracurricular_activities == nil || jmpcSchool.extracurricular_activities?.count == 0 {
                Text("Extracurricular Activities not mentioned")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                Text(jmpcSchool.extracurricular_activities ?? "")
            }
        }
        .padding()
    }
}

#Preview {
    DetailSchoolExtracurricularActivities(jmpcSchool: Constant.previewSchoolModel[0])
}
