//
//  DetailEditView.swift
//  MyFavourites
//
//  Created by D103-15 on 03/12/2023.
//

import SwiftUI

struct DetailEditView: View {
    
    @Environment(ModelData.self) var modelData
    @Binding var item: Item
    
    var body: some View {
        Form {
            Section(header: Text("Edit Details")) {
                TextField("Name", text: $item.name)
                TextField("Category", text: $item.category)
            }
            Section(header: Text("Edit Description")) {
                TextEditor(text: $item.description)
            }
        }
    }
}

#Preview {
    let modelData = ModelData()
    //.constant as it is binding
    return DetailEditView(item: .constant(modelData.items[0])).environment(modelData)
}
