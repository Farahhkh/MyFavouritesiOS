//
//  ContentView.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ItemList().tabItem {
                Label("All", systemImage: "list.bullet")
            }
            FavoriteList().tabItem {
                Label ("Favorites", systemImage: "star")
            }
        }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
