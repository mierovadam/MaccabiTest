//
//  Product.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import Foundation

struct Product: Identifiable, Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
