//
//  FavoriteGrid.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

struct FavoriteGrid: View {
    @Environment(ModelData.self) var modelData
    
    var filteredItems: [Item] {
        modelData.items.filter {
            item in (item.isFavorite)
        }
    }
    
    var content = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationStack {
            Divider()
            ScrollView {
                //To remove \.id, use Identifiable
                LazyVGrid(columns: content) {
                    ForEach(filteredItems) {
                        item in
                        NavigationLink {
                            ItemDetail(item: item)
                        } label: {
                            ItemGrid(item: item)
                        }
                    }
                }.padding()
                    .toolbar {
                        NavigationLink {
                            FavoriteList().navigationBarBackButtonHidden(true)
                        } label: {
                            Text("List")
                        }
                    }
                Spacer()
            }.navigationTitle("Favorites")
            
        }
    }
}


#Preview {
    return FavoriteGrid().environment(ModelData())
}
