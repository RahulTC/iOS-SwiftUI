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
    
    @FetchRequest(entity: ProductEntity.entity(), sortDescriptors: [])
    var results: FetchedResults<ProductEntity>
    let request: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
    
    var body: some View {
        VStack{
            List {
//                ForEach(productViewModel.filteredProductsList) { product in
//                    Text(product.title)
//                }
                ForEach(results) {product in
                    ProductDetailCell(product: Product(id: Int(product.id),
                                                       title: product.title ?? "",
                                                       description: product.description,
                                                       price: Int(product.price),
                                                       discountPercentage: product.discountPercentage,
                                                       rating: product.rating,
                                                       stock: Int(product.stock),
                                                       brand: product.brand ?? "",
                                                       category: product.category ?? "",
                                                       thumbnail: product.thumbnail ?? "",
                                                       images: ["x.circle"]))
                }
            }
        }
        .searchable(text: $searchText, placement: .automatic, prompt: "Search Product")
        .onChange(of: searchText) { oldValue, newValue in
            productViewModel.searchResultsFromFilteredList(searchText: newValue)
        }
        .onAppear {
            productViewModel.getAPIData(urlString: Constant.digimonListEndpoint)
            if productViewModel.customError != nil {
                isErrorOccurred = true
            }
        }
        .refreshable {
            productViewModel.getAPIData(urlString: Constant.digimonListEndpoint)
        }
    }
}

#Preview {
    ProductListView()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}

struct ProductDetailCell: View {
    var product: Product
    var body: some View {
        HStack(alignment:.center){
            VStack(alignment:.leading){
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image.resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView().frame(width: 100, height: 100)
                }
            }
            VStack(alignment:.leading){
                Text(product.title)
                Text(product.brand)
                Text(product.category)
                Text("\(product.price)")
            }
        }
    }
}
