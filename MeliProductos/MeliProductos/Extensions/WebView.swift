//
//  WebView.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 1/5/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}
