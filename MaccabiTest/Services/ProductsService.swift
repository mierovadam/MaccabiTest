//
//  ProductsService.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import Foundation
import Combine

class ProductsService {
    
    @Published var allProducts: [Product] = []
    var cancellables: AnyCancellable?
    
    init() {
        getProducts()
    }
    
    func getProducts() {
        // Check cache first
        // for better solution we need indication that data has changed (some api call when loading the app), at this state data wont ever update after caching once
        if let cachedProducts = CacheManager.shared.getCachedProducts(), !cachedProducts.isEmpty {
            self.allProducts = cachedProducts
            print("cache data")
            return
        }
        
        // If no cache, download data
        guard let url = URL(string: "https://dummyjson.com/products?limit=100") else { return }
        
        cancellables = NetworkingManager.download(url: url)
            .decode(type: AllProductsResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (response) in
                self?.allProducts = response.products
                print("api data")
                CacheManager.shared.cacheProducts(response.products)
            })
    }
}
