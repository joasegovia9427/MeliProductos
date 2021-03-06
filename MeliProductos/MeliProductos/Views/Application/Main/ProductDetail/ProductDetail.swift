//
//  ProductDetail.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import SwiftUI

//This car could be load by an api, based on country
let mercadoPagoLink = "https://articulo.mercadolibre.com.uy/noindex/services/MLU478228904/payments?new_version=true&modal=false&newIndex=true"

struct ProductDetail: View {
    @Environment(\.openURL) var openURL
    
    var productDetailIn: Result?
    
    @State var detailHeader = ""
    @State var product_url = ""
    @State var product_title = ""
    @State var product_price = ""
    @State var product_condition = ""
    @State var product_link = ""
    @State var product_accepts_mercadopago = ""
    @State var product_soldQuantity = ""
    @State var product_availableQuantity = ""
    @State var product_seller_salesCompleted = ""
    @State var product_seller_link: String = ""
    
    @State private var showModalWebView = false
    @State private var showFullWebView = false
    
    @State private var showModalSafariViewController = false
    @State private var showFullSafariViewController = false
    
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            VStack{
                ScrollView(showsIndicators: false){
                    //// + Header
                    HeaderSimple(textToShow: " ")
                    //// - Header
                    
                    VStack {
                        VStack(alignment: .leading){
                            Text("Condición: \(detailHeader) vendidos").font(.subheadline).foregroundColor(Color("gray-dark")).multilineTextAlignment(.leading)
                            Text("\(product_title)").font(.title).foregroundColor(Color("meli-Blue")).multilineTextAlignment(.leading).lineLimit(Int.max)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack{
                            if product_url.isEmpty{
                                Image(systemName: "photo").resizable().aspectRatio( contentMode: .fit).frame(width: 100, height: 150, alignment: .center)
                            }else{
                                ImageByUrl(urlToLoad: product_url, maxHeight: 200)
                            }
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                        VStack(alignment: .leading){
                            Text("$ \(product_price)").font(.title).foregroundColor(Color("meli-Blue")).multilineTextAlignment(.leading).lineLimit(Int.max)
                            
                            HStack{
                                Image("shipping").resizable().aspectRatio( contentMode: .fit).frame(width: 20, height: 20, alignment: .center)
                                Text("Llega gratis").font(.subheadline).foregroundColor(Color("green"))
                                Text("mañana").font(.subheadline).fontWeight(.bold).foregroundColor(Color("green")).multilineTextAlignment(.leading).offset(x: -5)
                            }
                            HStack{
                                Text("Transacciones totales del: ").font(.subheadline).foregroundColor(Color("gray-dark"))
                                
                                ////A way to open a webView in App with SFSafariViewController
                                Button(action: {
                                    showModalSafariViewController = true
                                }, label: {
                                    Text("vendedor").font(.subheadline).foregroundColor(Color("primary")).offset(x: -5)
                                }).sheet(isPresented: $showModalSafariViewController, content: {
                                    SafariWebView(url: product_seller_link)
                                })
                                
                                Text("\(product_seller_salesCompleted)").font(.subheadline).foregroundColor(Color("gray-dark")).multilineTextAlignment(.leading).offset(x: -5)
                            }
                            
                            Text("Cantidad disponible: \(product_availableQuantity)").font(.subheadline).foregroundColor(Color("gray-dark")).padding(.top,5)
                            
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack{
                            ////Other way to open a webView in App with SFSafariViewController
                            Button(action: {
                                showFullSafariViewController = true
                            }, label: {
                                Text(String("Comprar ahora"))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("white"))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                    .background(Color("primary"))
                            }).cornerRadius(5).padding(.top, 20).padding(.bottom, 5)
                            
                            ////A way to open a webView in App with WKWebView
                            Button(action: {
                                showFullWebView = true
                            }, label: {
                                Text(String("Agregar al carrito"))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("primary"))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                    .background(Color("secondary"))
                            }).cornerRadius(5).padding(.top, 5).padding(.bottom, 20)
                            
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                        VStack(alignment: .leading){
                            Text("Medios de pago").font(.title2).foregroundColor(Color("gray-dark")).multilineTextAlignment(.leading)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack{
                            ////Other way to open a webView in App with WKWebView
                            Button(action: {
                                showModalWebView = true
                            }, label: {
                                HStack{
                                    Image(systemName: "creditcard").resizable().aspectRatio( contentMode: .fit).frame(width: 20, height: 20, alignment: .center).foregroundColor(Color("white"))
                                    Text("Acepta Mercado Pago").font(.subheadline).foregroundColor(Color("white"))
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                    .background(Color("green"))
                            }).cornerRadius(5).padding(.bottom, 30)
                                .sheet(isPresented: $showModalWebView, content: {
                                WebView(url: mercadoPagoLink)
                            })
                            
                            VStack(alignment: .leading){
                                Text("Preguntas").font(.title2).foregroundColor(Color("gray-dark")).multilineTextAlignment(.leading)
                            }.frame(maxWidth: .infinity, alignment: .leading)
                            
                        ////Other way to open a link in browser
                           Link(destination: URL(string: "\(product_link_global)")!, label: {
                               Text(String("Preguntar"))
                                   .fontWeight(.bold)
                                   .foregroundColor(Color("white"))
                                   .frame(maxWidth: .infinity, alignment: .center)
                                   .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                   .background(Color("primary")).cornerRadius(5).padding(.bottom, 20)
                           })
                            
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                    }.frame(maxWidth: .infinity).padding(.horizontal, 20.0)
                    
                    Spacer().frame(height: 50)
                    
                    NavigationLink(isActive: $showFullWebView, destination: {WebView(url: product_link)}, label: {EmptyView()})
                    NavigationLink(isActive: $showFullSafariViewController, destination: {SafariWebView(url: product_link)}, label: {EmptyView()})
                    
                }
                
            }.ignoresSafeArea()
                .onAppear(perform: {
                    changeNavColor()
                    
                    //This section is used to format and picture the variables and atts of Product to show
                    product_url = productDetailIn!.thumbnail.trimmingCharacters(in: .whitespacesAndNewlines) //"https://http2.mlstatic.com/D_943484-MLA46651720937_072021-I.jpg"//
                    product_title = productDetailIn!.title.trimmingCharacters(in: .whitespacesAndNewlines) //"Motorola"//
                    product_price = String(format: "%.02f", productDetailIn!.price) //"59000"//
                    if productDetailIn!.condition.uppercased()=="NEW"{
                        product_condition = "Nuevo"
                    }else{
                        product_condition = "Usado"
                    }
                    product_soldQuantity = String(productDetailIn!.soldQuantity)//"5"
                    product_availableQuantity = String(productDetailIn!.availableQuantity)//"6"
                    product_link = productDetailIn!.permalink//"https://articulo.mercadolibre.com.ar/MLA-801250166-adaptador-conversor-mini-display-port-a-vga-hdmi-dvi-3-sal-_JM"
                    product_seller_salesCompleted = String(productDetailIn!.seller.seller_reputation.metrics.sales.completed)//"59000"//
                    product_seller_link = productDetailIn!.seller.permalink//"https://perfil.mercadolibre.com.ar/LUTECH2018" //
                    
                    detailHeader = String("\(product_condition) | \(product_soldQuantity)")
                    
                })
        }
        
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail()
    }
}
