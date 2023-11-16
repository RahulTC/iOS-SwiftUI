//
//  DetailSchoolContact.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct DetailSchoolContact: View {
    var jmpcSchool: SchoolModel
    var body: some View {
        
        VStack {
            Text("School Contact")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.bottom, 15)
                .minimumScaleFactor(0.5)
            
            VStack(alignment:.leading, spacing: 0){
                
                if jmpcSchool.phone_number != nil || (jmpcSchool.phone_number?.count != 0) {
                    Text("Phn No. - \(jmpcSchool.phone_number!)")
                }
                
                if jmpcSchool.school_email != nil || (jmpcSchool.school_email?.count != 0) {
                    Text("Email - \(jmpcSchool.school_email!)")
                }
                
                if jmpcSchool.website != nil || (jmpcSchool.website?.count != 0) {
                    Text("Website - \(jmpcSchool.website!)")
                }
            }
        }
    }
}

#Preview {
    DetailSchoolContact(jmpcSchool: Constant.previewSchoolModel[0])
}
