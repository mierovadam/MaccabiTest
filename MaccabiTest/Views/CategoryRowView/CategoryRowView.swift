//
//  CategoryRowView.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import SwiftUI

struct CategoryRowView: View {
    var imageUrlStr: String
    var categoryName: String
    var numOfProducts: Int
    var numOfProductsInStock: Int
    
    //I know i could have used same views for ProductRowView, but i rather have it this way since i cant predict future modifications and maybe someday they will be way different.
    var body: some View {
        HStack {
            productImage
            
            VStack(alignment: .leading) {
                Text(categoryName).font(.title)
                Text("\(numOfProductsInStock) / \(numOfProducts) products are in stock!").font(.subheadline)
            }
            
            Spacer()
        }
        .border(.black, width: 1)
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(imageUrlStr: "https://cdn.dummyjson.com/product-images/2/2.jpg", categoryName: "Clothes", numOfProducts: 50, numOfProductsInStock: 20)
    }
}

extension CategoryRowView {
    var productImage: some View {
        AsyncImage(url: URL(string: imageUrlStr)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "questionmark")
        }
        .frame(width: 100, height: 100)
    }
    
    
}
