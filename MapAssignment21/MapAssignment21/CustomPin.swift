//
//  CustomPin.swift
//  MapAssignment21
//
//  Created by Rahul Adepu on 12/10/23.
//

import SwiftUI

struct CustomPin: View {
    
    var title: String
    @State var showTitle = true
    
    var body: some View {
        VStack(spacing:0){
            Group{
                Text(title)
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(5)
                    .background(.white)
                    .opacity(showTitle ? 0 : 1)
                
                Image(systemName: "circle.fill")
                    .font(.title)
                Image(systemName: "arrowtriangle.down.fill")
                    .font(.body)
                    .offset(CGSize(width: 0.0, height: -5))
            }
            .foregroundStyle(Color.red.opacity(0.6))
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                showTitle.toggle()
            }
        }
    }
}

#Preview {
    CustomPin(title: "Mumbai")
}
