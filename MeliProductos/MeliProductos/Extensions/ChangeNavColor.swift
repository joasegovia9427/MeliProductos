//
//  ChangeNAvColor.swift
//  MeliProductos
//
//  Created by Joaquin Segovia on 24/4/22.
//

import Foundation
import SwiftUI

func changeNavColor() {
    let navStyles = UINavigationBar.appearance()
    // This will set the color of the text for the back buttons.
    navStyles.tintColor = UIColor(named: "meli-Blue")
    // This will set the background color for navBar
    //  navStyles.barTintColor = .black
}
