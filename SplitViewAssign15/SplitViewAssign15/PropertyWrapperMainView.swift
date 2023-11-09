//
//  PropertyWrapperMainView.swift
//  SplitViewAssign15
//
//  Created by Rahul Adepu on 11/9/23.
//

import SwiftUI

struct PropertyWrapperMainView: View {
    
    @State var boxColor:Bool  = false
    @State var boxTitle:String = "Main View Box Title"

    var body: some View {
        VStack{
            Text(boxTitle)
                .font(.system(size: 68))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            Rectangle()
                .frame(maxWidth: 400, maxHeight: 400)
                .ignoresSafeArea(.all)
                .foregroundStyle(boxColor ? Color.green.opacity(0.8) : Color.red.opacity(0.8))
                .padding(50)
            // Button to toggle the Box color
            Button(action: {
                boxColor.toggle()
            }, label: {
                Text("Switch Color")
                    .modifier(ButtonDesign1())
            })
            .padding(.bottom, 30)
            
            // @BindingView to share data between two views
            NavigationLink {
                BindingExampleView(boxColorChangeFromChildView: $boxTitle)
            } label: {
                Text("Binding View")
                    .modifier(ButtonDesign1())
            }

            
        }
    }
}

#Preview {
    NavigationStack{
        PropertyWrapperMainView()
    }
}



