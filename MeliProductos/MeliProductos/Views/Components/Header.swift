//
//  Header.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import SwiftUI

struct Header: View {
    var textToShow: String
    
    var body: some View {
        VStack{
            ZStack{
                Color("meli-Yellow")
                VStack{
                    Image("Imagotipo").resizable().aspectRatio( contentMode: .fit).frame(height: 100)
                    if(!textToShow.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    {
                        Text(textToShow.trimmingCharacters(in: .whitespacesAndNewlines))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("meli-Blue"))
                    }
                }
            }
        }.frame(height: 200, alignment: .top)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(textToShow: "Test")
    }
}
