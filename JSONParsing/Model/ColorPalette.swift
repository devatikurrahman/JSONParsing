//
//  ColorPalette.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/18/23.
//

import Foundation

struct ColorPalette: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "palette_name"
        case info = "palette_info"
        case colors = "palette_colors"
    }
    
    struct PaletterColor: Decodable {
        enum CodingKeys: String, CodingKey {
            case order = "sort_order"
            case description = "description"
            case red = "red"
            case green = "green"
            case blue = "blue"
            case alpha = "alpha"
        }
        let order: Int
        let description: String
        let red: Int
        let green: Int
        let blue: Int
        let alpha: Double
    }
    let name: String
    let info: String
    let colors: [PaletterColor]
    //let palette_colors: [PaletterColor]
    
    /* If we use camelCase instead of snake_case for a variable, then JSON parsing will fail due to mismatch of fields name, in this case we can use decoder keyDecodingStrategy (convertFromSnakeCase)
     */
    //let paletteColors: [PaletterColor]
}

extension ColorPalette {
    static let colorPalette: ColorPalette = getJSONData(file: "FlatColors.json")
}

extension ColorPalette {
    var getJSONData1: Decodable {
        guard let sourceURL = Bundle.main.url(forResource: "FlatColors", withExtension: "json") else {
            fatalError("Could not find Flat")
        }
        
        guard let data = try? Data(contentsOf: sourceURL) else {
            fatalError("Could not convert data from FlatColors")
        }
        
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let loadedData = try? decoder.decode(ColorPalette.self, from: data) else {
            fatalError("Could not decode FlatColors's data in the project!")
        }
        
        return loadedData
    }
    
    static func getJSONData<T: Decodable>(file: String) -> T {
        guard let sourceURL = Bundle.main.url(forResource: "FlatColors", withExtension: "json") else {
            fatalError("Could not find \(file) in the project!")
        }
        
        guard let data = try? Data(contentsOf: sourceURL) else {
            fatalError("Could not convert data from \(file)")
        }
        
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file)'s data in the project!")
        }
        
        return loadedData
    }
}


