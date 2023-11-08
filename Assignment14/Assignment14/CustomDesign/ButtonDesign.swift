//
//  ButtonDesign.swift
//  Assignment15
//
//  Created by Rahul Adepu on 11/7/23.
//

import SwiftUI

struct ButtonDesign1: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.red.opacity(0.8))
            .clipShape(
                RoundedRectangle(cornerRadius: 15, style: .continuous))
            .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 15)
            .padding()
    }
}
