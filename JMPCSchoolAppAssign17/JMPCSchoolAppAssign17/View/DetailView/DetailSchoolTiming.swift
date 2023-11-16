//
//  DetailSchoolTiming.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct DetailSchoolTiming: View {
    var jmpcSchool: SchoolModel
    var body: some View {
        VStack{
            Text("School Timings")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.bottom, 15)
                .minimumScaleFactor(0.5)
            
            if jmpcSchool.start_time == nil || (jmpcSchool.start_time?.count == 0) ||
                jmpcSchool.end_time == nil || (jmpcSchool.end_time?.count == 0){
                Text("School Timings not mentioned")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                HStack(spacing: 20){
                    VStack(spacing: 5){
                        Text(jmpcSchool.start_time!)
                            .font(.title)
                            .fontWeight(.bold)
                        Divider()
                        Text("Start Time")
                    }
                    .modifier(satScoreCardDesign1())
                    VStack(spacing: 5){
                        Text(jmpcSchool.end_time!)
                            .font(.title)
                            .fontWeight(.bold)
                        Divider()
                        Text("End Time")
                    }
                    .modifier(satScoreCardDesign1())
                }
            }
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    DetailSchoolTiming(jmpcSchool: Constant.previewSchoolModel[0])
}
