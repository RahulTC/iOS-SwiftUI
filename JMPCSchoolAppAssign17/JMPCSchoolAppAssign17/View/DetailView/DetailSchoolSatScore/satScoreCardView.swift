//
//  satScoreCardView.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct satScoreCardView: View {
    
    var satScore:String
    var satTestType: String
    
    var body: some View {
        VStack(spacing: 5){
            Text(satScore)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.black)
            Divider()
            Text(satTestType)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    satScoreCardView(satScore: "356", satTestType: "Writing")
}
