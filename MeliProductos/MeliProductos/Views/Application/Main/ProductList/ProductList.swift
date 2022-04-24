//
//  ProductList.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import SwiftUI

var product_url                 = ""
var product_title               = ""
var product_price               = ""
var product_condition           = ""

struct ProductList: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var refresh: Bool = false
    
    @State var textFromPreviousView: String
    @State var isNavigateToProductDetailActive:Bool = false
    
    @ObservedObject var productResultadoJSONListFound = ProductListGet(productName: global_textToSearch)
    
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            //// + Header
            HeaderSimple(textToShow: textFromPreviousView)
            //// - Header
            Text("Resultados obtenidos para su busqueda: \(productResultadoJSONListFound.productsArray.count)")
                .foregroundColor(Color("gray-dark")).padding(.horizontal, 10.0)
            VStack{
                if productResultadoJSONListFound.productsArray.count == 0{
                    VStack{
                        Image("searchIcon").resizable().aspectRatio( contentMode: .fit).frame(width: 100, height: 150, alignment: .center)
                        Text("No hay publicaciones que coincidan con tu búsqueda.").foregroundColor(Color("black")).font(.title).multilineTextAlignment(.leading).padding()
                        Text("Revisa la ortografía de la palabra.").foregroundColor(Color("black")).font(.subheadline).multilineTextAlignment(.leading).padding()
                        Text("Utiliza palabras más genéricas o menos palabras.").foregroundColor(Color("black")).font(.subheadline).multilineTextAlignment(.leading).padding()
                    }.padding()
                }else{
                    ScrollView(showsIndicators: false){
                        VStack{
                            LazyVGrid(columns: formaGrid, spacing: 8){
                                ForEach(productResultadoJSONListFound.productsArray, id: \.self){
                                    producto in
                                    
                                    { () -> Text in
                                        product_url = producto.thumbnail.trimmingCharacters(in: .whitespacesAndNewlines)
                                        product_title = producto.title.trimmingCharacters(in: .whitespacesAndNewlines)
                                        product_price = String(format: "AR$ %.02f", producto.price)
                                        product_condition = producto.condition.uppercased()
                                        
                                        return Text("") }()
                                    
                                    
                                    
                                    Divider().frame(height: 1).background(Color("gray-light"))
                                    Button(action:{
                                        isNavigateToProductDetailActive.toggle()
                                    } , label: {
                                        
                                        VStack{
                                            HStack{
                                                VStack{
                                                    if product_url.isEmpty{
                                                        Image(systemName: "photo").resizable().aspectRatio( contentMode: .fit).frame(width: 100, height: 150, alignment: .center)
                                                    }else{
                                                        ImageByUrl(urlToLoad: product_url)
                                                    }
                                                }
                                                VStack(alignment: .leading){
                                                    Text(product_title).font(.subheadline).foregroundColor(Color("primary")).multilineTextAlignment(.leading)
                                                    Text(product_price).fontWeight(.bold).foregroundColor(Color("black")).font(.title).multilineTextAlignment(.leading)
                                                    Text(product_condition).foregroundColor(Color("black")).font(.subheadline).multilineTextAlignment(.leading)
                                                }
                                                Spacer()
                                                VStack{
                                                    Image(systemName: "chevron.right").frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,5).foregroundColor(Color("primary"))
                                                }
                                            }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading,20).padding(.trailing,10)
                                        }
                                    })
                                }
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            NavigationLink(isActive: $isNavigateToProductDetailActive, destination: {ProductDetail()}, label: {EmptyView()})
            
        }.ignoresSafeArea().onAppear(perform: {
            changeNavColor()
            loadProductList(textToSearch: textFromPreviousView)
        }).onAppear(perform: {
//            self.productResultadoJSONListFound.productsArray = ProductListGet(productName: global_textToSearch)
        })
        .onDisappear(perform: {
//            refresh.toggle()
            print("CerrandoLista")
//            self.presentationMode.wrappedValue.dismiss()
        })
        
        
    }
    
    func loadProductList(textToSearch: String) {
        print("func loadListProduct(textToSearch: String)::\(textToSearch)")
        
        
    }
    
    func viewProductDetail() {
        print("func viewProductDetail()")
        
    }
    
    func changeNavColor() {
        let navStyles = UINavigationBar.appearance()
        // This will set the color of the text for the back buttons.
        navStyles.tintColor = UIColor(named: "meli-Blue")
        // This will set the background color for navBar
        //  navStyles.barTintColor = .black
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList(textFromPreviousView: "Test")
    }
}
