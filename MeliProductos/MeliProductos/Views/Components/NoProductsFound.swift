//
//  NoProductsFound.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 24/4/22.
//

import SwiftUI

struct NoProductsFound: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                Image("searchIconNotFound").resizable().aspectRatio( contentMode: .fit).frame(width: 100, height: 150, alignment: .center)
                Text("No hay publicaciones que coincidan con tu búsqueda.").foregroundColor(Color("black")).font(.title).multilineTextAlignment(.center).padding().lineLimit(Int.max)
                Text("Revisa la ortografía de la palabra.").foregroundColor(Color("black")).font(.subheadline).multilineTextAlignment(.center).padding().lineLimit(Int.max)
                Text("Utiliza palabras más genéricas o menos palabras.").foregroundColor(Color("black")).font(.subheadline).multilineTextAlignment(.center).padding().lineLimit(Int.max)
            }.padding()
        }
    }
}

struct NoProductsFound_Previews: PreviewProvider {
    static var previews: some View {
        NoProductsFound()
    }
}
