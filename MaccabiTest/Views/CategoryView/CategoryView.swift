//
//  CategoryView.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import SwiftUI

struct CategoryView: View {
    var products: [Product]
    
    var body: some View {
        productsList
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(products: dev.products)
    }
}
extension CategoryView {
    private var productsList: some View {
        List(products, id: \.id) { product in
            ProductRowView(product: product)
        }
        .listStyle(.plain)
    }
}
