//
//  CircleImage.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import SwiftUI

struct CircleImage: View {
    var itemImg: Image
    
    var body: some View {
        
        itemImg
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(itemImg: Image("sample1"))
}
