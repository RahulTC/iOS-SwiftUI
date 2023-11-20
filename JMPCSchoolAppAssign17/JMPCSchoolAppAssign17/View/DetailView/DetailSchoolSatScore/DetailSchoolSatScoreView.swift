//
//  DetailSchoolSatScoreView.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct DetailSchoolSatScoreView: View {
    var schoolSatList: [SchoolDetailModel]
    var body: some View {
        VStack {
            if (schoolSatList.isEmpty || schoolSatList[0].numSatTestTakers == "s") {
                Text("No Sat Scores Available")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                VStack{
                    Text("Average SAT Scores")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 25)
                    HStack(spacing:15){
                        Group{
                            satScoreCardView(satScore: schoolSatList[0].criticalReadingScore,
                                             satTestType: "Reading")
                            
                            satScoreCardView(satScore: schoolSatList[0].mathScore,
                                             satTestType: "Math")
                            
                            satScoreCardView(satScore: schoolSatList[0].writingScore,
                                             satTestType: "Writing")
                        }
                        .modifier(satScoreCardDesign1())
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    DetailSchoolSatScoreView(schoolSatList: Constant.previewSchoolDetailModel)
}
