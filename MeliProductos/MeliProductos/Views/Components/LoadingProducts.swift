//
//  LoadingProducts.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 25/4/22.
//

import SwiftUI

struct LoadingProducts: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                Image("searchIcon").resizable().aspectRatio( contentMode: .fit).frame(width: 100, height: 150, alignment: .center)
                Text("Buscando...").foregroundColor(Color("black")).font(.title).multilineTextAlignment(.center).padding().lineLimit(Int.max)
            }.padding()
        }
    }
}

struct LoadingProducts_Previews: PreviewProvider {
    static var previews: some View {
        LoadingProducts()
    }
}
