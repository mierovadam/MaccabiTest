//
//  AllProductsResponse.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import Foundation

struct AllProductsResponse: Codable {
    let products: [Product]
    let total, skip, limit: Int
}
