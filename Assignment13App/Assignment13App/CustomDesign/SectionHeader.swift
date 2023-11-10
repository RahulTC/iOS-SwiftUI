//
//  SectionHeader.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct SectionHeaderDesign1: ViewModifier{
    func body(content: Content) -> some View{
        content
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(Color.white)
            .background(Color.red.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
    }
}
