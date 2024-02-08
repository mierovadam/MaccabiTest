//
//  HomeViewModel.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allProducts: [Product] = []
    
    var uniqueCategories: [String] = []
    var productsByCategory: [String: [Product]] = [:]
    var stockByCategory: [String: Int] = [:]
    
    
    private let productsService = ProductsService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        productsService.$allProducts
            .map{ [weak self] products in
                
                self?.setCategoryProperties(products: products)
                return products
            }
            .sink { [weak self] (returnedProducts) in
                self?.allProducts = returnedProducts
            }
            .store(in: &cancellables)
    }
    
    private func setCategoryProperties(products: [Product]) {
        var dictionary: [String: [Product]] = [:]
        products.forEach { product in
            dictionary[product.category, default: []].append(product)
        }
        productsByCategory = dictionary
        uniqueCategories = Array(dictionary.keys).sorted()
        
        var stockDictionary: [String: Int] = [:]
        for (category, products) in dictionary {
            let stockCount = products.filter { $0.stock > 0 }.count
            stockDictionary[category] = stockCount
        }
        stockByCategory = stockDictionary
    }
    
}
