//
//  MainView.swift
//  JMPCSchoolAppAssign17
//
//  Created by Rahul Adepu on 11/11/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var jmpcSchoolViewModel = JMPCSchoolViewModel()
    @State var isErrorOccurred:Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("School List")
                    .padding(.bottom, 25)
                    .font(.system(size: 48))
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                List{
                    ForEach(jmpcSchoolViewModel.schoolList){ school in
                        SchoolListCellView(jmpcSchool: school)
                            .background(
                                NavigationLink("", destination: {
                                    DetailSchoolView(jmpcSchool: school)
                                })
                                .opacity(0))
                            .listRowInsets(.init(top: 5, leading: 20, bottom: 20, trailing: 20))
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
            }
            .task {
                await jmpcSchoolViewModel.getAPIData(urlString: Constant.DOEHighSchoolDirectory2017Endpoint)
                if jmpcSchoolViewModel.customError != nil {
                    isErrorOccurred = true
                }
            }
        }
        .alert(isPresented: $isErrorOccurred) {
            Alert(title: Text(jmpcSchoolViewModel.customError?.localizedDescription ?? ""),
                  message: Text("Try Again"),
                  dismissButton: .default(Text("Okay")))
        }
    }
}

#Preview {
    MainView()
}
