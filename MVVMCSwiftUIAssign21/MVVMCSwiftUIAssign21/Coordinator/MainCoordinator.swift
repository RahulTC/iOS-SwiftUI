//
//  MainCoordinator.swift
//  MVVMCSwiftUIAssign21
//
//  Created by Rahul Adepu on 12/12/23.
//

import SwiftUI

@MainActor
class MainCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var page: MyPage = .home
    func startCoordinator() {
        
    }
    
    func goToSecondScreen() {
        path.append(MyPage.secondView)
    }
    
    func goToThirdScreen() {
        path.append(MyPage.thirdView)
    }
    
    func goToFourthScreen() {
        path.append(MyPage.fourthView)
    }
    
    @ViewBuilder
    func getPage(page: MyPage) -> some View {
        switch page {
        case .home:
            StartView()
        case .secondView:
            SecondView()
        case .thirdView:
            ThirdView()
        case .fourthView:
            FourthView()
        }
    }
}

enum MyPage: String, CaseIterable, Identifiable{
    
    case home
    case secondView
    case thirdView
    case fourthView
    
    var id : String{ self.rawValue }
    
    
}
