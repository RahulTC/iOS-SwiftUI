//
//  SchoolDetailListCellView.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/12/23.
//

import SwiftUI

struct SchoolListCellView: View {
    
    var jmpcSchool: SchoolModel
    
    var body: some View {
        VStack(spacing: 0){
            SchoolListCellTitleView(jmpcSchool: jmpcSchool)
                .padding(.bottom, 20)
            Divider()
                .frame(height: 1)
                .overlay(.gray)
                .padding(.bottom, 5)
            SchoolListCellContentView(jmpcSchool: jmpcSchool)
        }
        .padding(20)
        .frame(height: 250)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: .black.opacity(0.3), radius: 8, x: 5, y: 8)
    }
}

#Preview {
    SchoolListCellView(jmpcSchool: Constant.previewSchoolModel[0])
}
