//
//  PreviewProvider.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
        
    let product = Product(id: 1, title: "Jeans", description: "some clothes description", price: 60, discountPercentage: 20.0, rating: 20.0, stock: 5, brand: "Levis", category: "Clothes", thumbnail: "", images: ["https://cdn.dummyjson.com/product-images/2/2.jpg"])
    
    let products = [Product(id: 1, title: "Jeans", description: "some clothes description", price: 60, discountPercentage: 20.0, rating: 20.0, stock: 5, brand: "Levis", category: "Clothes", thumbnail: "", images: ["https://cdn.dummyjson.com/product-images/2/2.jpg"]),
                    Product(id: 1, title: "Jeans", description: "some clothes description", price: 60, discountPercentage: 20.0, rating: 20.0, stock: 5, brand: "Levis", category: "Clothes", thumbnail: "", images: ["https://cdn.dummyjson.com/product-images/2/2.jpg"]),
                    Product(id: 1, title: "Jeans", description: "some clothes description", price: 60, discountPercentage: 20.0, rating: 20.0, stock: 5, brand: "Levis", category: "Clothes", thumbnail: "", images: ["https://cdn.dummyjson.com/product-images/2/2.jpg"]),
                    Product(id: 1, title: "Jeans", description: "some clothes description", price: 60, discountPercentage: 20.0, rating: 20.0, stock: 5, brand: "Levis", category: "Clothes", thumbnail: "", images: ["https://cdn.dummyjson.com/product-images/2/2.jpg"]),
                    Product(id: 1, title: "Jeans", description: "some clothes description", price: 60, discountPercentage: 20.0, rating: 20.0, stock: 5, brand: "Levis", category: "Clothes", thumbnail: "", images: ["https://cdn.dummyjson.com/product-images/2/2.jpg"])]
}

