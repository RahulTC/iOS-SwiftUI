//
//  SchoolListCellContentView.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/14/23.
//

import SwiftUI

struct SchoolListCellContentView: View {
    var jmpcSchool: SchoolModel
    var body: some View {
        HStack(spacing:0){
            Text(jmpcSchool.overview_paragraph)
                .frame(maxHeight: .infinity)
                .font(.callout)
                .lineLimit(6)
                .truncationMode(.tail)
                .padding(.horizontal, 10)
            Divider()
                .frame(width: 4)
                .overlay(.gray)
            VStack(spacing:0){
                Text(jmpcSchool.total_students ?? "-")
                    .minimumScaleFactor(0.2)
                    .underline(color: .gray)
                Text("Total Students")
                    .padding(.bottom, 15)
                Text(jmpcSchool.finalgrades)
                    .minimumScaleFactor(0.2)
                    .underline(color: .gray)
                Text("Final Grades")
            }
            .frame(minWidth: 100)
            .padding(.horizontal, 10)
            
        }
    }
}


#Preview {
    SchoolListCellContentView(jmpcSchool: Constant.previewSchoolModel[0])
}
