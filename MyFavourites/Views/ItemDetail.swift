//
//  ItemDetail.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

struct ItemDetail: View {
    var item: Item
    
    @Environment(ModelData.self) var modelData
    
    @State private var isEditing = false
    @State private var editingItem = Item.emptyItem
    
    var dataIndex: Int {
        modelData.items.firstIndex(where: { $0.id == item.id })!
    }
    
    
    var body: some View {
        @Bindable var modelData = modelData
        NavigationStack {
            ScrollView {
                VStack {
                    CircleImage(itemImg: item.image)
                    
                    HStack{
                        Text(item.name).font(.title)
                        FavoriteButton(isSet: $modelData.items[dataIndex].isFavorite)
                    }
                    
                    Text(item.category).font(.subheadline).foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text(item.description)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        isEditing = true
                    }
                }
            }
            .sheet(isPresented: $isEditing) {
                NavigationStack {
                    DetailEditView(item: $editingItem)
                        .navigationTitle(item.name)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isEditing = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isEditing = false
                                    modelData.items[dataIndex].name = editingItem.name
                                    modelData.items[dataIndex].category = editingItem.category
                                    modelData.items[dataIndex].description = editingItem.description
                                }
                                
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    let modelData = ModelData()
    return ItemDetail(item: modelData.items[0]).environment(modelData)
}
