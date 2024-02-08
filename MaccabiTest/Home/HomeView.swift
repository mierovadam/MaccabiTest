//
//  HomeView.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var selectedCategoryProducts: [Product]? = nil
    @State private var showCategoryView: Bool = false
    
    var body: some View {
        ZStack {
            productsList
        }
        .background(
            NavigationLink(destination: CategoryView(products: selectedCategoryProducts ?? []),
                           isActive: $showCategoryView,
                           label: {EmptyView()}).opacity(0)
        )
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var productsList: some View {
        List(vm.uniqueCategories, id: \.self) { category in
            if let products = vm.productsByCategory[category] {
                let numOfProducts = products.count
                let numOfProductsInStock = vm.stockByCategory[category] ?? 0
                let imageUrlStr = vm.productsByCategory[category]?.first?.images.first ?? ""
                
                CategoryRowView(
                    imageUrlStr: imageUrlStr,
                    categoryName: category,
                    numOfProducts: numOfProducts,
                    numOfProductsInStock: numOfProductsInStock
                )
                .onTapGesture {
                    selectedCategoryProducts = products
                    showCategoryView.toggle()
                }
                
            }
        }
        .listStyle(.plain)
    }

}
