//
//  ItemRow.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    
    var body: some View {
        HStack {
            item.image
                .resizable()
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(item.name)
                //only preview first two lines
                Text(item.description).foregroundStyle(.secondary).lineLimit(2)
            }
            
            Spacer()
            
            if item.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let items = ModelData().items
    return ItemRow(item: items[0])
}
