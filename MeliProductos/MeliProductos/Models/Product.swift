//
//  Product.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import Foundation
//import CoreImage
import SwiftUI

//Tool:: https://app.quicktype.io

////

//struct ProductList_Items: Codable, Hashable, Hashable {
//    var productList:[Product]
//}
//
//struct Results: Codable, Hashable, Hashable{
//    var results:[Product]
//}



struct Product: Codable, Hashable {
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Result: Codable, Hashable {
    let title: String//?
    let price: Double//?
    let availableQuantity, soldQuantity: Int?
    let condition: String//?
    let permalink: String?
    let thumbnail: String//?
    let shipping: Shipping//?

    enum CodingKeys: String, CodingKey {
        case title, price
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition, permalink, thumbnail
        case shipping
    }
}

// MARK: - Shipping
struct Shipping: Codable, Hashable {
    let freeShipping: Bool//?
    let mode: String?
    let tags: [String]?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case storePickUp = "store_pick_up"
    }
}





// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   var productListItems = try? newJSONDecoder().decode(ProductListItems.self, from: jsonData)

//
//// MARK: - ProductListItems
//
//struct ProductListItems: Codable, Hashable{
//    var site_id : String?
//    var country_default_time_zone : String?
//    var query : String?
//    var paging : Paging?
//    var resultsJSON : [ResultsJSON]?
//    var sort : Sort?
//    var available_sorts : [Available_sorts]?
//    var filters : [Filtros]?
//    var available_filters : [Available_filters]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case site_id = "site_id"
//        case country_default_time_zone = "country_default_time_zone"
//        case query = "query"
//        case paging = "paging"
//        case resultsJSON = "results"
//        case sort = "sort"
//        case available_sorts = "available_sorts"
//        case filters = "filters"
//        case available_filters = "available_filters"
//    }
//
//    
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
////        country_default_time_zone = try values.decodeIfPresent(String.self, forKey: .country_default_time_zone)
////        query = try values.decodeIfPresent(String.self, forKey: .query)
////        paging = try values.decodeIfPresent(Paging.self, forKey: .paging)
////        results = try values.decodeIfPresent([Results].self, forKey: .results)
////        sort = try values.decodeIfPresent(Sort.self, forKey: .sort)
////        available_sorts = try values.decodeIfPresent([Available_sorts].self, forKey: .available_sorts)
////        filters = try values.decodeIfPresent([String].self, forKey: .filters)
////        available_filters = try values.decodeIfPresent([Available_filters].self, forKey: .available_filters)
////    }
//
//}
//
//struct Filtros : Codable, Hashable {
//}
//struct Address : Codable, Hashable {
//    var state_id : String?
//    var state_name : String?
//    var city_id : String?
//    var city_name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case state_id = "state_id"
//        case state_name = "state_name"
//        case city_id = "city_id"
//        case city_name = "city_name"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        state_id = try values.decodeIfPresent(String.self, forKey: .state_id)
////        state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
////        city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
////        city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
////    }
//
//}
//
//struct ResultsJSON : Codable, Hashable {
//    var id : String?
//    var site_id : String?
//    var title : String?
//    var seller : Seller?
//    var price : Int?
//    var prices : Prices?
//    var sale_price : String?
//    var currency_id : String?
//    var available_quantity : Int?
//    var sold_quantity : Int?
//    var buying_mode : String?
//    var listing_type_id : String?
//    var stop_time : String?
//    var condition : String?
//    var permalink : String?
//    var thumbnail : String?
//    var thumbnail_id : String?
//    var accepts_mercadopago : Bool?
//    var installments : Installments?
//    var address : Address?
//    var shipping : Shipping?
//    var seller_address : Seller_address?
//    var attributes : [Attributes]?
//    var original_price : String?
//    var category_id : String?
//    var official_store_id : String?
//    var domain_id : String?
//    var catalog_product_id : String?
//    var tags : [String]?
//    var order_backend : Int?
//    var use_thumbnail_id : Bool?
//    var offer_score : String?
//    var offer_share : String?
//    var match_score : String?
//    var winner_item_id : String?
//    var melicoin : String?
//    var discounts : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case site_id = "site_id"
//        case title = "title"
//        case seller = "seller"
//        case price = "price"
//        case prices = "prices"
//        case sale_price = "sale_price"
//        case currency_id = "currency_id"
//        case available_quantity = "available_quantity"
//        case sold_quantity = "sold_quantity"
//        case buying_mode = "buying_mode"
//        case listing_type_id = "listing_type_id"
//        case stop_time = "stop_time"
//        case condition = "condition"
//        case permalink = "permalink"
//        case thumbnail = "thumbnail"
//        case thumbnail_id = "thumbnail_id"
//        case accepts_mercadopago = "accepts_mercadopago"
//        case installments = "installments"
//        case address = "address"
//        case shipping = "shipping"
//        case seller_address = "seller_address"
//        case attributes = "attributes"
//        case original_price = "original_price"
//        case category_id = "category_id"
//        case official_store_id = "official_store_id"
//        case domain_id = "domain_id"
//        case catalog_product_id = "catalog_product_id"
//        case tags = "tags"
//        case order_backend = "order_backend"
//        case use_thumbnail_id = "use_thumbnail_id"
//        case offer_score = "offer_score"
//        case offer_share = "offer_share"
//        case match_score = "match_score"
//        case winner_item_id = "winner_item_id"
//        case melicoin = "melicoin"
//        case discounts = "discounts"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
////        title = try values.decodeIfPresent(String.self, forKey: .title)
////        seller = try values.decodeIfPresent(Seller.self, forKey: .seller)
////        price = try values.decodeIfPresent(Int.self, forKey: .price)
////        prices = try values.decodeIfPresent(Prices.self, forKey: .prices)
////        sale_price = try values.decodeIfPresent(String.self, forKey: .sale_price)
////        currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
////        available_quantity = try values.decodeIfPresent(Int.self, forKey: .available_quantity)
////        sold_quantity = try values.decodeIfPresent(Int.self, forKey: .sold_quantity)
////        buying_mode = try values.decodeIfPresent(String.self, forKey: .buying_mode)
////        listing_type_id = try values.decodeIfPresent(String.self, forKey: .listing_type_id)
////        stop_time = try values.decodeIfPresent(String.self, forKey: .stop_time)
////        condition = try values.decodeIfPresent(String.self, forKey: .condition)
////        permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
////        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
////        thumbnail_id = try values.decodeIfPresent(String.self, forKey: .thumbnail_id)
////        accepts_mercadopago = try values.decodeIfPresent(Bool.self, forKey: .accepts_mercadopago)
////        installments = try values.decodeIfPresent(Installments.self, forKey: .installments)
////        address = try values.decodeIfPresent(Address.self, forKey: .address)
////        shipping = try values.decodeIfPresent(Shipping.self, forKey: .shipping)
////        seller_address = try values.decodeIfPresent(Seller_address.self, forKey: .seller_address)
////        attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
////        original_price = try values.decodeIfPresent(String.self, forKey: .original_price)
////        category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
////        official_store_id = try values.decodeIfPresent(String.self, forKey: .official_store_id)
////        domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
////        catalog_product_id = try values.decodeIfPresent(String.self, forKey: .catalog_product_id)
////        tags = try values.decodeIfPresent([String].self, forKey: .tags)
////        order_backend = try values.decodeIfPresent(Int.self, forKey: .order_backend)
////        use_thumbnail_id = try values.decodeIfPresent(Bool.self, forKey: .use_thumbnail_id)
////        offer_score = try values.decodeIfPresent(String.self, forKey: .offer_score)
////        offer_share = try values.decodeIfPresent(String.self, forKey: .offer_share)
////        match_score = try values.decodeIfPresent(String.self, forKey: .match_score)
////        winner_item_id = try values.decodeIfPresent(String.self, forKey: .winner_item_id)
////        melicoin = try values.decodeIfPresent(String.self, forKey: .melicoin)
////        discounts = try values.decodeIfPresent(String.self, forKey: .discounts)
////    }
//
//}
//
//    struct Prices : Codable, Hashable {
//        var id : String?
//        var prices : [Prices]?
//        var presentation : Presentation?
//        var payment_method_prices : [String]?
//        var reference_prices : [Reference_prices]?
//        var purchase_discounts : [String]?
//
//        enum CodingKeys: String, CodingKey {
//
//            case id = "id"
//            case prices = "prices"
//            case presentation = "presentation"
//            case payment_method_prices = "payment_method_prices"
//            case reference_prices = "reference_prices"
//            case purchase_discounts = "purchase_discounts"
//        }
//
////        init(from decoder: Decoder) throws {
////            var values = try decoder.container(keyedBy: CodingKeys.self)
////            id = try values.decodeIfPresent(String.self, forKey: .id)
////            prices = try values.decodeIfPresent([Prices].self, forKey: .prices)
////            presentation = try values.decodeIfPresent(Presentation.self, forKey: .presentation)
////            payment_method_prices = try values.decodeIfPresent([String].self, forKey: .payment_method_prices)
////            reference_prices = try values.decodeIfPresent([Reference_prices].self, forKey: .reference_prices)
////            purchase_discounts = try values.decodeIfPresent([String].self, forKey: .purchase_discounts)
////        }
//
//    }
//
//
//
//
//
//struct Installments : Codable, Hashable {
//    var quantity : Int?
//    var amount : Double?
//    var rate : Double?
//    var currency_id : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case quantity = "quantity"
//        case amount = "amount"
//        case rate = "rate"
//        case currency_id = "currency_id"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
////        amount = try values.decodeIfPresent(Double.self, forKey: .amount)
////        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
////        currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
////    }
//
//}
//struct Eshop : Codable, Hashable {
//    var seller : Int?
//    var eshop_rubro : String?
//    var eshop_id : Int?
//    var nick_name : String?
//    var site_id : String?
//    var eshop_logo_url : String?
//    var eshop_status_id : Int?
//    var eshop_experience : Int?
//    var eshop_locations : [String]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case seller = "seller"
//        case eshop_rubro = "eshop_rubro"
//        case eshop_id = "eshop_id"
//        case nick_name = "nick_name"
//        case site_id = "site_id"
//        case eshop_logo_url = "eshop_logo_url"
//        case eshop_status_id = "eshop_status_id"
//        case eshop_experience = "eshop_experience"
//        case eshop_locations = "eshop_locations"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        seller = try values.decodeIfPresent(Int.self, forKey: .seller)
////        eshop_rubro = try values.decodeIfPresent(String.self, forKey: .eshop_rubro)
////        eshop_id = try values.decodeIfPresent(Int.self, forKey: .eshop_id)
////        nick_name = try values.decodeIfPresent(String.self, forKey: .nick_name)
////        site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
////        eshop_logo_url = try values.decodeIfPresent(String.self, forKey: .eshop_logo_url)
////        eshop_status_id = try values.decodeIfPresent(Int.self, forKey: .eshop_status_id)
////        eshop_experience = try values.decodeIfPresent(Int.self, forKey: .eshop_experience)
////        eshop_locations = try values.decodeIfPresent([String].self, forKey: .eshop_locations)
////    }
//
//}
//struct Delayed_handling_time : Codable, Hashable {
//    var period : String?
//    var rate : Double?
//    var value : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case period = "period"
//        case rate = "rate"
//        case value = "value"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        period = try values.decodeIfPresent(String.self, forKey: .period)
////        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
////        value = try values.decodeIfPresent(Int.self, forKey: .value)
////    }
//
//}
//struct Country : Codable, Hashable {
//    var id : String?
//    var name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        name = try values.decodeIfPresent(String.self, forKey: .name)
////    }
//
//}
//struct Conditions : Codable, Hashable {
//    var context_restrictions : [String]?
//    var start_time : String?
//    var end_time : String?
//    var eligible : Bool?
//
//    enum CodingKeys: String, CodingKey {
//
//        case context_restrictions = "context_restrictions"
//        case start_time = "start_time"
//        case end_time = "end_time"
//        case eligible = "eligible"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        context_restrictions = try values.decodeIfPresent([String].self, forKey: .context_restrictions)
////        start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
////        end_time = try values.decodeIfPresent(String.self, forKey: .end_time)
////        eligible = try values.decodeIfPresent(Bool.self, forKey: .eligible)
////    }
//
//}
//struct Claims : Codable, Hashable {
//    var period : String?
//    var rate : Double?
//    var value : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case period = "period"
//        case rate = "rate"
//        case value = "value"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        period = try values.decodeIfPresent(String.self, forKey: .period)
////        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
////        value = try values.decodeIfPresent(Int.self, forKey: .value)
////    }
//
//}
//struct City : Codable, Hashable {
//    var id : String?
//    var name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        name = try values.decodeIfPresent(String.self, forKey: .name)
////    }
//
//}
//struct Cancellations : Codable, Hashable {
//    var period : String?
//    var rate : Double?
//    var value : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case period = "period"
//        case rate = "rate"
//        case value = "value"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        period = try values.decodeIfPresent(String.self, forKey: .period)
////        rate = try values.decodeIfPresent(Int.self, forKey: .rate)
////        value = try values.decodeIfPresent(Int.self, forKey: .value)
////    }
//
//}
//struct Available_sorts : Codable, Hashable {
//    var id : String?
//    var name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        name = try values.decodeIfPresent(String.self, forKey: .name)
////    }
//
//}
//struct Available_filters : Codable, Hashable {
//    var id : String?
//    var name : String?
//    var type : String?
//    var values : [Values]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//        case type = "type"
//        case values = "values"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        name = try values.decodeIfPresent(String.self, forKey: .name)
////        type = try values.decodeIfPresent(String.self, forKey: .type)
//////        values = try values.decodeIfPresent([Values].self, forKey: .values)
////    }
//
//}
//
//struct valueStruct : Codable, Hashable {
//    
//}
//
//struct Attributes : Codable, Hashable {
//    var name : String?
//    var value_id : String?
//    var value_name : String?
//    var id : String?
//    var value_struct : valueStruct?
//    var values : [Values]?
//    var attribute_group_id : String?
//    var attribute_group_name : String?
//    var source : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case name = "name"
//        case value_id = "value_id"
//        case value_name = "value_name"
//        case id = "id"
//        case value_struct = "value_struct"
//        case values = "values"
//        case attribute_group_id = "attribute_group_id"
//        case attribute_group_name = "attribute_group_name"
//        case source = "source"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        name = try values.decodeIfPresent(String.self, forKey: .name)
////        value_id = try values.decodeIfPresent(String.self, forKey: .value_id)
////        value_name = try values.decodeIfPresent(String.self, forKey: .value_name)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        value_struct = try values.decodeIfPresent(String.self, forKey: .value_struct)
//////        values = try values.decodeIfPresent([Values].self, forKey: .values)
////        attribute_group_id = try values.decodeIfPresent(String.self, forKey: .attribute_group_id)
////        attribute_group_name = try values.decodeIfPresent(String.self, forKey: .attribute_group_name)
////        source = try values.decodeIfPresent(Int.self, forKey: .source)
////    }
//
//}
//
//
//
//struct Values : Codable, Hashable {
//    var id : String?
//    var name : String?
//    var results : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//        case results = "results"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        name = try values.decodeIfPresent(String.self, forKey: .name)
////        results = try values.decodeIfPresent(Int.self, forKey: .results)
////    }
//
//}
//
//
//struct Transactions : Codable, Hashable {
//    var canceled : Int?
//    var period : String?
//    var total : Int?
//    var ratings : Ratings?
//    var completed : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case canceled = "canceled"
//        case period = "period"
//        case total = "total"
//        case ratings = "ratings"
//        case completed = "completed"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        canceled = try values.decodeIfPresent(Int.self, forKey: .canceled)
////        period = try values.decodeIfPresent(String.self, forKey: .period)
////        total = try values.decodeIfPresent(Int.self, forKey: .total)
////        ratings = try values.decodeIfPresent(Ratings.self, forKey: .ratings)
////        completed = try values.decodeIfPresent(Int.self, forKey: .completed)
////    }
//
//}
//
//struct StateJSON : Codable, Hashable {
//    var id : String?
//    var name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        name = try values.decodeIfPresent(String.self, forKey: .name)
////    }
//
//}
//
//struct Shipping : Codable, Hashable {
//    var free_shipping : Bool?
//    var mode : String?
//    var tags : [String]?
//    var logistic_type : String?
//    var store_pick_up : Bool?
//
//    enum CodingKeys: String, CodingKey {
//
//        case free_shipping = "free_shipping"
//        case mode = "mode"
//        case tags = "tags"
//        case logistic_type = "logistic_type"
//        case store_pick_up = "store_pick_up"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        free_shipping = try values.decodeIfPresent(Bool.self, forKey: .free_shipping)
////        mode = try values.decodeIfPresent(String.self, forKey: .mode)
////        tags = try values.decodeIfPresent([String].self, forKey: .tags)
////        logistic_type = try values.decodeIfPresent(String.self, forKey: .logistic_type)
////        store_pick_up = try values.decodeIfPresent(Bool.self, forKey: .store_pick_up)
////    }
//
//}
//struct Seller : Codable, Hashable {
//    var id : Int?
//    var permalink : String?
//    var registration_date : String?
//    var car_dealer : Bool?
//    var real_estate_agency : Bool?
//    var tags : [String]?
//    var eshop : Eshop?
//    var seller_reputation : Seller_reputation?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case permalink = "permalink"
//        case registration_date = "registration_date"
//        case car_dealer = "car_dealer"
//        case real_estate_agency = "real_estate_agency"
//        case tags = "tags"
//        case eshop = "eshop"
//        case seller_reputation = "seller_reputation"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(Int.self, forKey: .id)
////        permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
////        registration_date = try values.decodeIfPresent(String.self, forKey: .registration_date)
////        car_dealer = try values.decodeIfPresent(Bool.self, forKey: .car_dealer)
////        real_estate_agency = try values.decodeIfPresent(Bool.self, forKey: .real_estate_agency)
////        tags = try values.decodeIfPresent([String].self, forKey: .tags)
////        eshop = try values.decodeIfPresent(Eshop.self, forKey: .eshop)
////        seller_reputation = try values.decodeIfPresent(Seller_reputation.self, forKey: .seller_reputation)
////    }
//
//}
//struct Seller_reputation : Codable, Hashable {
//    var power_seller_status : String?
//    var level_id : String?
//    var metrics : Metrics?
//    var transactions : Transactions?
//
//    enum CodingKeys: String, CodingKey {
//
//        case power_seller_status = "power_seller_status"
//        case level_id = "level_id"
//        case metrics = "metrics"
//        case transactions = "transactions"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        power_seller_status = try values.decodeIfPresent(String.self, forKey: .power_seller_status)
////        level_id = try values.decodeIfPresent(String.self, forKey: .level_id)
////        metrics = try values.decodeIfPresent(Metrics.self, forKey: .metrics)
////        transactions = try values.decodeIfPresent(Transactions.self, forKey: .transactions)
////    }
//
//}
//struct Seller_address : Codable, Hashable {
//    var id : String?
//    var comment : String?
//    var address_line : String?
//    var zip_code : String?
//    var country : Country?
//    var state : StateJSON?
//    var city : City?
//    var latitude : String?
//    var longitude : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case comment = "comment"
//        case address_line = "address_line"
//        case zip_code = "zip_code"
//        case country = "country"
//        case state = "state"
//        case city = "city"
//        case latitude = "latitude"
//        case longitude = "longitude"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        comment = try values.decodeIfPresent(String.self, forKey: .comment)
////        address_line = try values.decodeIfPresent(String.self, forKey: .address_line)
////        zip_code = try values.decodeIfPresent(String.self, forKey: .zip_code)
////        country = try values.decodeIfPresent(Country.self, forKey: .country)
////        state = try values.decodeIfPresent(State.self, forKey: .state)
////        city = try values.decodeIfPresent(City.self, forKey: .city)
////        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
////        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
////    }
//
//}
//struct Sales : Codable, Hashable {
//    var period : String?
//    var completed : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case period = "period"
//        case completed = "completed"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        period = try values.decodeIfPresent(String.self, forKey: .period)
////        completed = try values.decodeIfPresent(Int.self, forKey: .completed)
////    }
//
//}
//struct Reference_prices : Codable, Hashable {
//    var id : String?
//    var type : String?
//    var conditions : Conditions?
//    var amount : Int?
//    var currency_id : String?
//    var exchange_rate_context : String?
//    var tags : [String]?
//    var last_updated : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case type = "type"
//        case conditions = "conditions"
//        case amount = "amount"
//        case currency_id = "currency_id"
//        case exchange_rate_context = "exchange_rate_context"
//        case tags = "tags"
//        case last_updated = "last_updated"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        type = try values.decodeIfPresent(String.self, forKey: .type)
////        conditions = try values.decodeIfPresent(Conditions.self, forKey: .conditions)
////        amount = try values.decodeIfPresent(Int.self, forKey: .amount)
////        currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
////        exchange_rate_context = try values.decodeIfPresent(String.self, forKey: .exchange_rate_context)
////        tags = try values.decodeIfPresent([String].self, forKey: .tags)
////        last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
////    }
//
//}
//struct Ratings : Codable, Hashable {
//    var negative : Double?
//    var neutral : Double?
//    var positive : Double?
//
//    enum CodingKeys: String, CodingKey {
//
//        case negative = "negative"
//        case neutral = "neutral"
//        case positive = "positive"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        negative = try values.decodeIfPresent(Int.self, forKey: .negative)
////        neutral = try values.decodeIfPresent(Double.self, forKey: .neutral)
////        positive = try values.decodeIfPresent(Double.self, forKey: .positive)
////    }
//
//}
//struct Presentation : Codable, Hashable {
//    var display_currency : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case display_currency = "display_currency"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        display_currency = try values.decodeIfPresent(String.self, forKey: .display_currency)
////    }
//
//}
//struct Sort : Codable, Hashable {
//    var id : String?
//    var name : String?
//
//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        id = try values.decodeIfPresent(String.self, forKey: .id)
////        name = try values.decodeIfPresent(String.self, forKey: .name)
////    }
//
//}
//struct Paging : Codable, Hashable {
//    var total : Int?
//    var primary_results : Int?
//    var offset : Int?
//    var limit : Int?
//
//    enum CodingKeys: String, CodingKey {
//
//        case total = "total"
//        case primary_results = "primary_results"
//        case offset = "offset"
//        case limit = "limit"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        total = try values.decodeIfPresent(Int.self, forKey: .total)
////        primary_results = try values.decodeIfPresent(Int.self, forKey: .primary_results)
////        offset = try values.decodeIfPresent(Int.self, forKey: .offset)
////        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
////    }
//
//}
//struct Metrics : Codable, Hashable {
//    var cancellations : Cancellations?
//    var claims : Claims?
//    var delayed_handling_time : Delayed_handling_time?
//    var sales : Sales?
//
//    enum CodingKeys: String, CodingKey {
//
//        case cancellations = "cancellations"
//        case claims = "claims"
//        case delayed_handling_time = "delayed_handling_time"
//        case sales = "sales"
//    }
//
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////        cancellations = try values.decodeIfPresent(Cancellations.self, forKey: .cancellations)
////        claims = try values.decodeIfPresent(Claims.self, forKey: .claims)
////        delayed_handling_time = try values.decodeIfPresent(Delayed_handling_time.self, forKey: .delayed_handling_time)
////        sales = try values.decodeIfPresent(Sales.self, forKey: .sales)
////    }
//
//}
////struct Metadata : Codable, Hashable {
////
////    enum CodingKeys: String, CodingKey {
////
////    }
////
////    init(from decoder: Decoder) throws {
////        var values = try decoder.container(keyedBy: CodingKeys.self)
////    }
////
////}
