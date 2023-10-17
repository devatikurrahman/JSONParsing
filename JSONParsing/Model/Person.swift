//
//  Person.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/17/23.
//

import Foundation

struct Person: Decodable {
    let name: String
    let age: Int
    let gender: String
    let sign: String
    let partner: String?
    let isEmployed: Bool
}

extension Person {
    static let singlePerson: Person = Bundle.main.decodeJSON(file: "example1.json")
    static let allPerson: [Person] = Bundle.main.decodeJSON(file: "example2.json")
    static let samplePerson: Person = allPerson[0]
}

extension Bundle {
    func decodeJSON<T: Decodable>(file: String) -> T {
        guard let sourceURL = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        
        guard let data = try? Data(contentsOf: sourceURL) else {
            fatalError("Could not load \(file) in the project!")
        }
        
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file)'s data in the project!")
        }
        
        return loadedData
    }
}
