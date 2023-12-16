//
//  ItemGrid.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

struct ItemGrid: View {
    var item: Item
    
    var body: some View {
        ZStack {
            Rectangle()
            VStack() {
                item.image
                    .resizable()
                    .frame(width: 70, height: 70)
                Text(item.name).foregroundStyle(.black).font(.subheadline)
            }.frame(maxWidth: .infinity).padding().background(.white).cornerRadius(18)
        }
        
    }
}

#Preview {
    let items = ModelData().items
    return ItemGrid(item: items[0])
}
