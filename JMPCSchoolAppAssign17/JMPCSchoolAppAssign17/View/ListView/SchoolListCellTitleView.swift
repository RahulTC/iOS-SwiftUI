//
//  SchoolListCellTitleView.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/13/23.
//

import SwiftUI

struct SchoolListCellTitleView: View {
    
    var jmpcSchool: SchoolModel
    
    var body: some View {
        VStack{
            Group{
                Text(jmpcSchool.school_name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.2)
                HStack(spacing:3){
                    Text("\(jmpcSchool.city),")
                    Text(jmpcSchool.state_code)
                }
            }
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SchoolListCellTitleView(jmpcSchool: Constant.previewSchoolModel[0])
}
