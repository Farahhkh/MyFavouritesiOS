//
//  ItemList.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

struct ItemList: View {
    
    //State is the source of information
    //Declare as private to hold information
    
    @State private var showFavoritesOnly = false
    
    //Environment wrapper
    @Environment(ModelData.self) var modelData
    
    var filteredItems: [Item] {
        modelData.items.filter {
            item in (!showFavoritesOnly || !item.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationStack {
            //To remove \.id, use Identifiable
            List() {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Hide favorites")
                }
                
                ForEach(filteredItems) {
                    item in
                    NavigationLink {
                        ItemDetail(item: item)
                    } label: {
                        ItemRow(item: item)
                    }
                
                }.onMove(perform: { indices, newOffset in
                    //long press to move an item to a new position
                    modelData.items.move(fromOffsets: indices, toOffset: newOffset)
                    //save data after move
                    write(modelData.items, "itemData.json")
                })
                .onDelete(perform: { indexSet in
                    modelData.items.remove(atOffsets: indexSet)
                    write(modelData.items, "itemData.json")
                })
                
            }.navigationTitle("Rooms").onAppear() {
                //save data every time page is opened
                write(modelData.items, "itemData.json")
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ItemList().environment(ModelData())
}
