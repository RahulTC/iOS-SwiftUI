//
//  UserListViewMapMarker.swift
//  MapAsignment20
//
//  Created by Rahul Adepu on 12/7/23.
//

import SwiftUI

struct UserListViewMapMarker: View {
    
    @StateObject var usersViewModel = UsersViewModel()
    @State var isErrorOccurred:Bool = false
    @State var searchText: String = ""
    
    var body: some View {
        VStack{
            if !usersViewModel.filteredUsersList.isEmpty {
                List{
                    ForEach(usersViewModel.filteredUsersList) { user in
                        NavigationLink {
                            UserDetailViewMapMarker(user: user)
                        } label: {
                            Text(user.name)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText, placement: .automatic, prompt: "Search User")
        .onChange(of: searchText) { oldValue, newValue in
            usersViewModel.searchResultsFromFilteredList(searchText: newValue)
        }
        .onAppear {
            usersViewModel.getAPIData(urlString: Constant.userListEndpoint)
            if usersViewModel.customError != nil {
                isErrorOccurred = true
            }
        }
        .refreshable {
            usersViewModel.getAPIData(urlString: Constant.userListEndpoint)
        }
    }
}

#Preview {
    UserListViewMapMarker()
}
