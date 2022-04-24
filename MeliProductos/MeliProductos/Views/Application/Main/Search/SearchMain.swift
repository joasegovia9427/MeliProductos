//
//  SearchMain.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import SwiftUI

var global_textToSearch:String = ""

struct SearchMain: View {
    @State var input_textSearch = "Motorola G6"
    @State var isProductsInfoEmpty = false
    @State var isInputTextSearchEmpty = false
    @State var isNavigateToProductListActive:Bool = false


    var body: some View {
        VStack{
            if #available(iOS 14.7, *) {
                VStack{
                    //// + Header
                    Header(textToShow: "Busca tu producto")
                    //// - Header

                    VStack{
                        //// + TextField Search Component
                        HStack{
                            ZStack(alignment: .leading){
                                if(input_textSearch.isEmpty){
                                    Text("Buscar en Meli Productos").font(.caption).foregroundColor(Color("gray-dark")).font(.caption)
                                }
                                TextField("", text: $input_textSearch).foregroundColor(Color("primary"))
                            }

                            if(input_textSearch.isEmpty){
                                Image(systemName: "magnifyingglass").foregroundColor(input_textSearch.isEmpty ? Color("gray-dark") : Color("primary"))
                            }else{
                                Button(action: {searchProduct(textToSearch: input_textSearch)}, label: {
                                    Image(systemName: "magnifyingglass").foregroundColor(input_textSearch.isEmpty ? Color("gray-dark") : Color("primary"))
                                }).alert(isPresented: $isInputTextSearchEmpty){
                                    Alert(title: Text("Error"), message: Text("Ingrese nombre de producto a buscar"), dismissButton: .default(Text("Entendido")))
                                }
                                .alert(isPresented: $isProductsInfoEmpty){
                                    Alert(title: Text("Error"), message: Text("No se encontraron productos con '\(input_textSearch)'"), dismissButton: .default(Text("Entendido")))
                                }
                            }

                            if(input_textSearch.isEmpty){
                                Image(systemName: "xmark").foregroundColor(input_textSearch.isEmpty ? Color("gray-dark") : Color("primary"))
                            }else{
                                Button(action: {input_textSearch=""}, label: {
                                    Image(systemName: "xmark").foregroundColor(Color("primary"))
                                })
                            }
                        }.padding(.all, 11.0).background(Color("gray-light")).cornerRadius(10)
                        /// - TextField Search Component

                        Button(action: {searchProduct(textToSearch: input_textSearch)}, label: {
                            Text(String("Buscar"))
                                .fontWeight(.bold)
                                .foregroundColor(Color("white"))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color("primary"))
                        }).cornerRadius(10).padding(.top, 20).padding(.bottom, 20).alert(isPresented: $isInputTextSearchEmpty){
                            Alert(title: Text("Error"), message: Text("Ingrese nombre de producto a buscar"), dismissButton: .default(Text("Entendido")))
                        }

                    }.padding(.all, 20)

                    //                        Spacer()
                    //Implementare categorias Dentro de un ScrollView

                    Spacer()

                }.ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }

            NavigationLink(isActive: $isNavigateToProductListActive, destination: {ProductList(textFromPreviousView: input_textSearch)}, label: {EmptyView()})

        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            ////.navigationViewStyle(StackNavigationViewStyle())
            
    }

    func searchProduct(textToSearch: String) {
        print("func searchProduct(textToSearch: String)::\(textToSearch)")
        input_textSearch = input_textSearch.trimmingCharacters(in: .whitespacesAndNewlines)
        if textToSearch.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isInputTextSearchEmpty = true
        }else{
            global_textToSearch = input_textSearch
            isNavigateToProductListActive = true
        }
        print("isNavigateToProductListActive::\(isNavigateToProductListActive)")

    }
}

struct SearchMain_Previews: PreviewProvider {
    static var previews: some View {
        SearchMain()
    }
}
