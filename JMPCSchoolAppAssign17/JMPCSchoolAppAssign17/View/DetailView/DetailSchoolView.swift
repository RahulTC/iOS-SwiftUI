//
//  DetailSchoolView.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/13/23.
//

import SwiftUI

struct DetailSchoolView: View {
    @State var isErrorOccurred:Bool = false
    
    @StateObject var jmpcSchoolDetailViewModel = JMPCSchoolDetailViewModel()
    var jmpcSchool: SchoolModel
    
    var body: some View {
        VStack{
            // Title View
            DetailSchoolTitleView(jmpcSchool: jmpcSchool)
                .padding(10)
            ScrollView {
                // SAT Score View
                DetailSchoolSatScoreView(schoolSatList: jmpcSchoolDetailViewModel.schoolSatList)
                    .modifier(blockCardDesign1())
                
                // Academic Opportunities
                DetailSchoolAcademicOpportunities(jmpcSchool: jmpcSchool)
                    .modifier(blockCardDesign1())
                
                // Extracurricular Activities
                DetailSchoolExtracurricularActivities(jmpcSchool: jmpcSchool)
                    .modifier(blockCardDesign1())
                
                // Requirement
                DetailSchoolRequirement(jmpcSchool: jmpcSchool)
                    .modifier(blockCardDesign1())
                
                // Admissions Priority
                DetailSchoolAdmissionsPriority(jmpcSchool: jmpcSchool)
                    .modifier(blockCardDesign1())
                
                // Timing
                DetailSchoolTiming(jmpcSchool: jmpcSchool)
                    .modifier(blockCardDesign1())
                
                // Contact
                DetailSchoolContact(jmpcSchool: jmpcSchool)
                    .modifier(blockCardDesign1())
            }
        }
        .task{
            let dbnValue = "?dbn=\(jmpcSchool.id)"
            let url = Constant.SATResultsEndpoint+dbnValue
            await jmpcSchoolDetailViewModel.getAPIData(urlString: url)
            if jmpcSchoolDetailViewModel.customError != nil {
                isErrorOccurred = true
            }
        }
    }
}

#Preview {
    DetailSchoolView(jmpcSchoolDetailViewModel: JMPCSchoolDetailViewModel(),
                     jmpcSchool: Constant.previewSchoolModel[0])
}
