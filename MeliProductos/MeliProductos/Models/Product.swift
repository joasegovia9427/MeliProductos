//
//  Product.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import Foundation

struct Product: Codable, Hashable {
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Result: Codable, Hashable {
    var title: String
    let price: Double
    let availableQuantity, soldQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String
    let shipping: Shipping
    let seller: Seller
    let accepts_mercadopago: Bool
    
    enum CodingKeys: String, CodingKey {
        case title, price
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition, permalink, thumbnail
        case shipping
        case seller
        case accepts_mercadopago = "accepts_mercadopago"
    }
}

struct Shipping: Codable, Hashable {
    let freeShipping: Bool
    let mode: String?
    let tags: [String]?
    let storePickUp: Bool?
    
    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case storePickUp = "store_pick_up"
    }
}

struct Seller: Codable, Hashable {
    let permalink: String
    let seller_reputation: Seller_reputation
    
    enum CodingKeys: String, CodingKey {
        case permalink = "permalink"
        case seller_reputation = "seller_reputation"
    }
}

struct Seller_reputation: Codable, Hashable {
    let metrics: Metrics
    
    enum CodingKeys: String, CodingKey {
        case metrics = "metrics"
    }
}

struct Metrics: Codable, Hashable  {
    let sales: Sales
    
    enum CodingKeys: String, CodingKey {
        case sales = "sales"
    }
}

struct Sales: Codable, Hashable  {
    let completed: Int
    
    enum CodingKeys: String, CodingKey {
        case completed = "completed"
    }
}
