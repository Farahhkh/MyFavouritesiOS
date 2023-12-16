//
//  MyFavouritesApp.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

@main
struct MyFavouritesApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(ModelData())
        }
    }
}
