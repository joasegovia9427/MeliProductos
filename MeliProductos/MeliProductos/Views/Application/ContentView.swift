//
//  ContentView.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 22/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            SearchMain()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
