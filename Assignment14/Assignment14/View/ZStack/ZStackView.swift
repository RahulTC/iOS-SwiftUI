//
//  ZStackView.swift
//  Assignment15
//
//  Created by Rahul Adepu on 11/7/23.
//

import SwiftUI

struct ZStackView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("ZStack \nAlignments".uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
            HStack{
                ZStackGenericView(alignment: .topLeading, alignmentString: "Top Leading")
                ZStackGenericView(alignment: .top, alignmentString: "Top")
                ZStackGenericView(alignment: .topTrailing, alignmentString: "Top Trailing")
            }
            HStack{
                ZStackGenericView(alignment: .leading, alignmentString: "Leading")
                ZStackGenericView(alignment: .center, alignmentString: "Center")
                ZStackGenericView(alignment: .trailing, alignmentString: "Trailing")
            }
            HStack{
                ZStackGenericView(alignment: .bottomLeading, alignmentString: "Bottom Leading")
                ZStackGenericView(alignment: .bottom, alignmentString: "Bottom")
                ZStackGenericView(alignment: .bottomTrailing, alignmentString: "Bottom Trailing")
            }
        }
    }
}

#Preview{
    ZStackView()
}

struct ZStackGenericView: View {
    var alignment: Alignment
    var alignmentString: String
    
    var body: some View {
        VStack{
            Text(alignmentString)
                .font(.footnote)
            ZStack(alignment:alignment){
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 120, height: 120)
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 80, height: 80)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 40, height: 40)
            }
        }
    }
}
