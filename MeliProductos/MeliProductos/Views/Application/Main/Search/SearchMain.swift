//
//  SearchMain.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import SwiftUI
import Combine

var global_textToSearch:String = ""

struct SearchMain: View {
    @Environment(\.openURL) var openURL
    
    @State var input_textSearch = ""//"Motorola G6"
    @State var isProductsInfoEmpty = false
    @State var isInputTextSearchEmpty = false
    @State var isNavigateToProductListActive:Bool = false
    
    
    var body: some View {
        
        ZStack {
            Color(.white).ignoresSafeArea()
            if #available(iOS 14.7, *) { //ScrollView availability 13+
                ScrollView(showsIndicators: false){
                    VStack{
                        VStack{
                            //// + Header
                            Header(textToShow: "Busca tu producto")
                            //// - Header
                            
                            VStack{
                                //// + TextField Search Component //This could be moved to a separate file
                                HStack{
                                    ZStack(alignment: .leading){
                                        if(input_textSearch.isEmpty){
                                            Text("Buscar en Meli Productos").font(.caption).foregroundColor(Color("gray-dark")).font(.caption)
                                        }
                                        TextField("", text: $input_textSearch).foregroundColor(Color("primary"))
                                            .onReceive(Just(input_textSearch)) { input_textSearch in
                                                print("input_textSearch:\(input_textSearch)")
                                                global_textToSearch = input_textSearch
                                                print("global_textToSearch:\(global_textToSearch)")
                                            }
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
                                
                                //This component could be moved to a separate file
                                Button(action: {searchProduct(textToSearch: input_textSearch)}, label: {
                                    Text(String("Buscar"))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("white"))
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                        .background(Color("primary"))
                                }).cornerRadius(5).padding(.top, 20).padding(.bottom, 20).alert(isPresented: $isInputTextSearchEmpty){
                                    Alert(title: Text("Error"), message: Text("Ingrese nombre de producto a buscar"), dismissButton: .default(Text("Entendido")))
                                }
                                
                            }.padding(.all, 20)
                            
                            //                        Spacer()
                            //This space could be used to load some categories
                            
                            Spacer().frame(height: 50)
                            
                            ////First way to open a link in browser
                            Button(action: {
                                openURL(URL(string: "https://www.linkedin.com/in/joaquinsegovia/")!)
                            }, label: {
                                HStack {
                                    Text("by Joaquin Segovia").font(.subheadline).foregroundColor(Color("primary")).offset(x: -5)
                                    Image("linkedin").resizable().aspectRatio( contentMode: .fit).frame(width: 20, height: 20, alignment: .center)
                                }
                            }).padding(.bottom, 50)
                        }.ignoresSafeArea()
                        
                        NavigationLink(isActive: $isNavigateToProductListActive, destination: {ProductList(textFromPreviousView: input_textSearch)}, label: {EmptyView()})
                        
                    }.navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .onDisappear(perform: {
                            global_textToSearch = input_textSearch
                        })
                }.ignoresSafeArea()
                    .onTapGesture {
                        //This code is to manage the keyboard behaviour when you want to tap 'Search'
                        if #available(iOS 13.0, *) {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }else{
                            UIApplication.shared.keyWindow?.endEditing(true)
                        }
                    }.onAppear(perform: {
                        UIScrollView.appearance().keyboardDismissMode = .onDrag
                    })
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    func searchProduct(textToSearch: String) {
        //This funciont could be used to log something
        print("func searchProduct(textToSearch: String)::\(textToSearch)")
        input_textSearch = input_textSearch.trimmingCharacters(in: .whitespacesAndNewlines)
        if textToSearch.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            isInputTextSearchEmpty = true
        }else{
            input_textSearch = input_textSearch+" "
            global_textToSearch = global_textToSearch.trimmingCharacters(in: .whitespacesAndNewlines)
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
