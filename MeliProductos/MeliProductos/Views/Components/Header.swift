//
//  Header.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 23/4/22.
//

////This component is for first or main screen which required a big header
import SwiftUI

struct Header: View {
    var textToShow: String
    
    var body: some View {
        VStack{
            ZStack{
                Color("meli-Yellow").ignoresSafeArea()
                
                VStack{
                    Image("Imagotipo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300).padding(.top, 20)
                    
                    if(!textToShow.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    {
                        Divider().frame(height: 1).background(Color("yellow-op50")).frame(width: 300)
                        
                        Text(textToShow.trimmingCharacters(in: .whitespacesAndNewlines))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("meli-Blue")).padding()
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }.frame(height: 350, alignment: .top)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(textToShow: "Test")
    }
}
