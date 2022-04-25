//
//  ImageByUrl.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 24/4/22.
//

import SwiftUI
import Kingfisher

var urlToLoadFix = ""

struct ImageByUrl: View {
    @State var urlToLoad: String
    @State var maxHeight: CGFloat
    
    var body: some View {
        {() -> Text in
            urlToLoadFix = urlToLoad.trimmingCharacters(in: .whitespacesAndNewlines)
            urlToLoadFix = urlToLoadFix.replacingOccurrences(of: "http://", with: "https://")
            return Text("")
        }()
        
        if #available(iOS 15.0, *) {
            //A partir de iOS 15 se podria usar                              https://developer.apple.com/documentation/swiftui/asyncimage
            
            AsyncImage( url: URL( string: urlToLoadFix )!  )
            { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding(.bottom, -15)
                    .frame(width: 100, height: maxHeight, alignment: .center)
            } placeholder: {
                placeholderImage()
            }
        } else {
            KFImage(URL(string: urlToLoadFix)!).resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle.init(cornerRadius: 4))
                .padding(.bottom, -15)
                .frame(width: 100, height: maxHeight, alignment: .center)
        }
    }
}

@ViewBuilder
func placeholderImage() -> some View {
    Image(systemName: "photo")
        .renderingMode(.template)
        .resizable()
        .aspectRatio(contentMode: .fit)
    
        .frame(width: 150, height: 150)
        .foregroundColor(.gray)
}

struct ImageByUrl_Previews: PreviewProvider {
    static var previews: some View {
        ImageByUrl(urlToLoad: "http://http2.mlstatic.com/D_943484-MLA46651720937_072021-I.jpg", maxHeight: 150)
    }
}
