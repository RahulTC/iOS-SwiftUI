//
//  TextField.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/6/23.
//

import SwiftUI

struct TextFieldDesign1: ViewModifier{
    func body(content: Content) -> some View{
        content
            .padding(15)
            .background(Color.gray.opacity(0.5))
            .clipShape(
                RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
