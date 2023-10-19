//
//  Book.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/18/23.
//

import Foundation

struct Book: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case feed, entry
    }
    struct Feed: Decodable {
        let publisher: String
        let country: String
    }
    struct Entry: Decodable {
        let author: String
        let nationality: String
    }
    
    let id = UUID()
    let feed: Feed
    let entry: [Entry]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        feed = try container.decode(Feed.self, forKey: .feed)
        do {
            entry = try container.decode([Entry].self, forKey: .entry)
        } catch {
            let newValue = try container.decode(Entry.self, forKey: .entry)
            entry = [newValue]
        }
    }
}

extension Book {
    static let allBooks: [Book] = getBookJSONData(file: "Books")
    static var showResult: String {
        var tmpStr = ""
        for book in allBooks {
            //print(book.feed.publisher)
            tmpStr += book.feed.publisher
        }
        return tmpStr
    }
}

extension Book {
    var getBookJSONData1: Decodable {
        guard let sourceURL = Bundle.main.url(forResource: "Books", withExtension: "json") else {
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
    
    static func getBookJSONData<T: Decodable>(file: String) -> T {
        guard let sourceURL = Bundle.main.url(forResource: file, withExtension: "json") else {
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
