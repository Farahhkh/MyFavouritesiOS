//
//  Item.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import Foundation
import SwiftUI

struct Item: Hashable, Codable, Identifiable {
    //Hashable allows us to use .hashValue
    //Codable allows us to move data to/from JSON
    
    var id: Int
    var name: String
    var category: String
    var description: String
    var isFavorite: Bool //favorites
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    static var emptyItem: Item {
        Item(id: 0, name: "", category: "", description: "", isFavorite: false, imageName: "")
    }
}
