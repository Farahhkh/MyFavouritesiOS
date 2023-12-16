//
//  ModelData.swift
//  MyFavourites
//
//  Created by D103-15 on 30/11/2023.
//

import Foundation

@Observable class ModelData {
    var items: [Item] = load("itemData.json")
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func write<T: Encodable>(_ array: [T], _ filename:String) {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        let encoder = JSONEncoder()
        try encoder.encode(array).write(to: file)
    } catch {
        fatalError("Couldn't write to \(filename).")
    }
}
