//
//  ProductList.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import SwiftUI

var product_url         = ""
var product_title       = ""
var product_price       = ""
var product_condition   = ""

struct ProductList: View {
    @State var refresh: Bool = false
    @State var textFromPreviousView: String
    @State var isNavigateToProductDetailActive:Bool = false
    
    @State var detail_product_url: String?
    @State var detail_product_title: String = ""
    @State var detail_product_price: Double?
    @State var detail_product_condition: String?
    
    @State var productToSendDetail: Result?
    
    @ObservedObject var productResultadoJSONListFound = ProductListGet(productName: global_textToSearch)
    
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            VStack{
                //// + Header
                HeaderSimple(textToShow: textFromPreviousView)
                //// - Header
                Text("Resultados obtenidos para su busqueda: \(productResultadoJSONListFound.productsArray.count)")
                    .foregroundColor(Color("gray-dark")).padding(.horizontal, 10.0)
                VStack{
                    
                    if productResultadoJSONListFound.productsArray.count == 0{
                        //                        ZStack{
                        //                            LoadingProducts()
                        //                            VStack{
                        //                                {() -> Text in
                        //                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        NoProductsFound()
                        //                                    }
                        //                                    return Text("")
                        //                                }()
                        //                            }
                        //                        }
                    }else{
                        ScrollView(showsIndicators: true){
                            VStack{
                                LazyVGrid(columns: formaGrid, spacing: 8){
                                    ForEach(productResultadoJSONListFound.productsArray, id: \.self){
                                        product in
                                        
                                        { () -> Text in
                                            product_url = product.thumbnail.trimmingCharacters(in: .whitespacesAndNewlines)
                                            product_title = product.title.trimmingCharacters(in: .whitespacesAndNewlines)
                                            product_price = String(format: "$ %.02f", product.price)
                                            product_condition = product.condition.uppercased()
                                            
                                            return Text("") }()
                                        
                                        
                                        Button(action:{
                                            productToSendDetail = product
                                            viewProductDetail()
                                        } , label: {
                                            
                                            VStack{
                                                HStack{
                                                    VStack{
                                                        if product_url.isEmpty{
                                                            Image(systemName: "photo").resizable().aspectRatio( contentMode: .fit).frame(width: 100, height: 150, alignment: .center)
                                                        }else{
                                                            ImageByUrl(urlToLoad: product_url, maxHeight: 150)
                                                        }
                                                    }
                                                    VStack(alignment: .leading){
                                                        Text(product_title).font(.subheadline).foregroundColor(Color("primary")).multilineTextAlignment(.leading)
                                                        Text(product_price).fontWeight(.bold).foregroundColor(Color("black")).font(.title).multilineTextAlignment(.leading)
                                                        Text(product_condition).foregroundColor(Color("black")).font(.subheadline).multilineTextAlignment(.leading)
                                                        HStack{
                                                            Image("shipping").resizable().aspectRatio( contentMode: .fit).frame(width: 20, height: 20, alignment: .center)
                                                            Text("Llega gratis").font(.subheadline).foregroundColor(Color("green"))
                                                            Text("mañana").font(.subheadline).fontWeight(.bold).foregroundColor(Color("green")).multilineTextAlignment(.leading).offset(x: -5)
                                                        }
                                                    }
                                                    Spacer()
                                                    VStack{
                                                        Image(systemName: "chevron.right").frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,5).foregroundColor(Color("primary"))
                                                    }
                                                }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading,20).padding(.trailing,10)
                                            }
                                        })
                                        Divider().frame(height: 1).background(Color("gray-light")).padding(.top, 10)
                                    }
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(isActive: $isNavigateToProductDetailActive, destination: {ProductDetail(productDetailIn: productToSendDetail)}, label: {EmptyView()})
                
            }.ignoresSafeArea()
                .onAppear(perform: {
                    changeNavColor()
                    loadProductList(textToSearch: textFromPreviousView)
                })
        }
    }
    
    func loadProductList(textToSearch: String) {
        print("func loadListProduct(textToSearch: String)::\(textToSearch)")
    }
    
    func viewProductDetail() {
        print("func viewProductDetail()")
        detail_product_title = product_title
        
        isNavigateToProductDetailActive.toggle()
    }
    
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList(textFromPreviousView: "Test")
    }
}
