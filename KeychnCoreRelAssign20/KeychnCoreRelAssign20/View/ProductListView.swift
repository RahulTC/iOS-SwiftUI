//
//  ProductListView.swift
//  CoreDataAssignment19
//
//  Created by Rahul Adepu on 11/27/23.
//

import SwiftUI
import CoreData

struct ProductListView: View {
    @StateObject var productViewModel = ProductsViewModel()
    @State var isErrorOccurred:Bool = false
    @State var searchText: String = ""
    
    @FetchRequest(sortDescriptors: []) var products: FetchedResults<ProductEntity>
    
    var body: some View {
        VStack{
            List {
                ForEach(products) { product in
                    ProductDetailCell(product: product)
                }
            }
        }
        .searchable(text: $searchText, placement: .automatic, prompt: "Search Product")
        .onChange(of: searchText) { oldValue, newValue in
            productViewModel.searchResultsFromFilteredList(searchText: newValue)
        }
        .onAppear {
            productViewModel.getAPIData(urlString: Constant.productsListEndpoint)
            if productViewModel.customError != nil {
                isErrorOccurred = true
            }
        }
        .refreshable {
            productViewModel.getAPIData(urlString: Constant.productsListEndpoint)
        }
    }
}

#Preview {
    ProductListView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}

struct ProductDetailCell: View {
    var product: ProductEntity
    var body: some View {
        HStack(alignment:.center){
            VStack(alignment:.leading){
                AsyncImage(url: URL(string: product.unwrappedThumbnail)) { image in
                    image.resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView().frame(width: 100, height: 100)
                }
            }
            VStack(alignment:.leading){
                Text(product.unwrappedTitle)
                Text(product.unwrappedBrand)
                Text(product.unwrappedCategory)
                Text("\(product.price)")
            }
        }
    }
}
