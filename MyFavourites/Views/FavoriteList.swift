//
//  FavoriteView.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

struct FavoriteList: View {
    @Environment(ModelData.self) var modelData
    
    var filteredItems: [Item] {
        modelData.items.filter {
            item in (item.isFavorite)
        }
    }
    
    var body: some View {
        NavigationStack {
            //To remove \.id, use Identifiable
            List() {
                ForEach(filteredItems) {
                    item in
                    NavigationLink {
                        ItemDetail(item: item)
                    } label: {
                        ItemRow(item: item)
                    }
                }
            }.navigationTitle("Favorites")
                .toolbar {
                    NavigationLink {
                        FavoriteGrid().navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Grid")
                    }
                }

        }
    }
}

#Preview {
    return FavoriteList().environment(ModelData())
}
