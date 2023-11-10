//
//  SwiftUIToUIKitView.swift
//  Assignment15
//
//  Created by Rahul Adepu on 11/7/23.
//

import SwiftUI

struct SwiftUIToUIKitView: View {
    
    var navController: UINavigationController?
    
    var body: some View {
        VStack{
            Text("SwiftUI View Page")
                .font(.title)
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 0.0)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            Button {
                print("Button Pressed!!!..")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(identifier: "UIKitViewControllerID")
//                navController = UINavigationController()
                navController?.pushViewController(viewController, animated: true)

            } label: {
                Text("Go to UIKit View")
                    .modifier(ButtonDesign1())
            }
        }
        
    }
}

#Preview {
    NavigationStack{
        SwiftUIToUIKitView()
        //        .environmentObject(NavControllerHolder())
    }
}
