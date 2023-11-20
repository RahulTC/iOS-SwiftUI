//
//  DetailSchoolTitleView.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/14/23.
//

import SwiftUI

struct DetailSchoolTitleView: View {
    var jmpcSchool: SchoolModel
    var body: some View {
        Group{
            if jmpcSchool.school_name.count >= 40 {
                Text(jmpcSchool.school_name)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
            } else if jmpcSchool.school_name.count >= 24 {
                Text(jmpcSchool.school_name)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            } else {
                Text(jmpcSchool.school_name)
                    .lineLimit(1)
            }
        }
        .multilineTextAlignment(.center)
        .font(.largeTitle)
        .fontWeight(.heavy)
        
    }
}

#Preview {
    DetailSchoolTitleView(jmpcSchool: Constant.previewSchoolModel[0])
}
