//
//  BindingExampleView.swift
//  SplitViewAssign15
//
//  Created by Rahul Adepu on 11/9/23.
//

import SwiftUI

struct BindingExampleView: View {
    
    @Binding var boxColorChangeFromChildView:String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Button(action: {
                boxColorChangeFromChildView = "Title Change from Second Screen"
                dismiss()
            }, label: {
                Text("Change Box Title From Main View")
                    .modifier(ButtonDesign1())
            })
        }
    }
}

#Preview {
    BindingExampleView(boxColorChangeFromChildView: .constant("ABC"))
}
