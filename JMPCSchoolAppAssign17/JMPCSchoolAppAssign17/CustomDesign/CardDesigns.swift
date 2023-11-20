//
//  CardDesigns.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/15/23.
//

import SwiftUI

struct satScoreCardDesign1: ViewModifier {
    func body(content: Content) -> some View{
        content
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(1))
            .clipShape(
                RoundedRectangle(cornerRadius: 15, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 5)
    }
}

struct blockCardDesign1: ViewModifier {
    func body(content: Content) -> some View{
        content
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(1))
            .clipShape(
                RoundedRectangle(cornerRadius: 15, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 5)
            .padding()
    }
}
