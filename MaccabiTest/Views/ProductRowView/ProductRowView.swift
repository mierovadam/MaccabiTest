//
//  ProductRowView.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import SwiftUI

struct ProductRowView: View {
    var product: Product
    
    var body: some View {
        HStack {
            productImage
            
            VStack(alignment: .leading) {
                Text(product.title).font(.title2)
                Text("\(product.price)$").font(.title3)
                Text("\(product.stock) units are in stock").font(.subheadline)
            }
            
            Spacer()
        }
        .border(.black, width: 1)
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product(id: 1, title: "Jeans", description: "some clothes description", price: 60, discountPercentage: 20.0, rating: 20.0, stock: 5, brand: "Levis", category: "Clothes", thumbnail: "", images: ["https://cdn.dummyjson.com/product-images/2/2.jpg"]))
    }
}

extension ProductRowView {
    var productImage: some View {
        AsyncImage(url: URL(string: product.images.first ?? "")) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "questionmark")
        }
        .frame(width: 100, height: 100)
    }
}
