//
//  HeaderSimple.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

import SwiftUI

struct HeaderSimple: View {
    var textToShow: String
    
    var body: some View {
        VStack{
            ZStack{
                Color("meli-Yellow")
                VStack{
                    Image("ImagotipoLandscape").resizable().aspectRatio( contentMode: .fit).frame(height: 25).padding(.top,50)
                    if(!textToShow.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    {
                        Text(textToShow.trimmingCharacters(in: .whitespacesAndNewlines))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("meli-Blue")).padding(.leading,20).padding(.trailing, 20)
                    }
                }
            }
        }.frame(height: 130, alignment: .top)
    }
}

struct HeaderSimple_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSimple(textToShow: "Test")
    }
}
