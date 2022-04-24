//
//  ProductList.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import Foundation
import SwiftUI

//class ProductListGet: ObservableObject{
//    @Published var productListInfo = ProductListItems()

//    @Published var resultadoJsonListInfo = ResultsJSON()

//    init(productName: String) {
////        Cable Thunderbolt O Adaptador Mini Displayport A Hdmi Mac
//        print("productName '\(productName)'")
//
//        let productNameSpaces = productName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let urlServer = URL(string:"https://api.mercadolibre.com/sites/MLA/search?q=\(productNameSpaces ?? "motorolaG6")")!
//        print("URL to find products of '\(productName)' - urlServer:: \(urlServer)")
//        var request = URLRequest(url: urlServer)
//        request.httpMethod = "GET"
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            do {
//                if let jsonData = data {
//                    print("JsonData size of '\(productName)':: \(jsonData)")
//                    let decodeData = try
//                    JSONDecoder().decode(ProductListItems.self, from: jsonData)
//                    DispatchQueue.main.async {
////                        self.$productListInfo.append(decodeData)
//                        self.$resultadoJsonListInfo.append(decodeData.resultsJSON!)
//                    }
//
//
//
//                }
//            } catch{
//                print("An error occurred trying to get product list '\(productName)':: \(error)")
//            }
//        }.resume()
//    }
//}

class ProductListGet: ObservableObject{
//    @Published var productsArray: [Result] = []
    @Published var productsArray = [Result]()
    
    var productListMain = [Product]()
    
    let baseURL: String = "https://api.mercadolibre.com/sites/MLA/"
    let endPoint: String = "search?"
    let params: String = "q="
    
    init(productName: String) {
        print("productName '\(productName)'")
        let productNameSpaces = productName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let urlServer = URL(string:"\(baseURL)\(endPoint)\(params)\(productNameSpaces ?? "motorolaG6")")!
        print("URL to find products of '\(productName)' - urlServer:: \(urlServer)")
        
        var request = URLRequest(url: urlServer)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    print("JsonData size of '\(productName)':: \(jsonData)")
                    let decodeData = try
                    JSONDecoder().decode(Product.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.productListMain.append(decodeData)
                        self.productsArray = self.productListMain[0].results!
                        print("self.productsArray:: \(self.productsArray.count)")
                    }
                }
            } catch{
                print("An error occurred trying to get product list '\(productName)':: \(error)")
            }
        }.resume()
    }
}






//class ProductListGet: ProductManagerProtocol {
//
//    func searchProducts(query: String, completion: @escaping (CompletionResult) -> Void){
//
//        let params: Parameters = [ "q": query]
//        let baseURL: String = "https://api.mercadolibre.com/sites/MLA"
//        let endPoint: String = "/search?/"
//
//        AF.request(baseURL + endPoint, method: .get, parameters: params).responseDecodable(of: Product.self){
//            (response) in
//            if let result = response.value?.results{
//
//                var productsArray: [Result] = []
//
//                for product in result{
//                    productsArray.append(product)
//                }
//                completion(.success(productsArray))
//
//                if(productsArray.isEmpty){
//                    completion(.empty)
//                }
//            } else {
//                completion(.failure((response.error?.errorDescription!)!))
//            }
//        }
//    }
//
//}

enum CompletionResult {
    case success([Result]?)
    case failure(String)
    case empty
}
