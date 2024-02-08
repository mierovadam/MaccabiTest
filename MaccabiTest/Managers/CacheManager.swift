//
//  CacheManager.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import Foundation

struct CacheManager {
    static let shared = CacheManager()
    private let userDefaults = UserDefaults.standard
    private let productsKey = "cachedProducts"

    func cacheProducts(_ products: [Product]) {
        //Can be done also with CoreData
        do {
            let data = try JSONEncoder().encode(products)
            userDefaults.set(data, forKey: productsKey)
        } catch {
            print("Error caching products: \(error)")
        }
    }

    func getCachedProducts() -> [Product]? {
        guard let data = userDefaults.data(forKey: productsKey) else { return nil }
        do {
            let products = try JSONDecoder().decode([Product].self, from: data)
            return products
        } catch {
            print("Error retrieving products from cache: \(error)")
            return nil
        }
    }
}
