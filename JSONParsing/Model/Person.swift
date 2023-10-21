//
//  Person.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/17/23.
//

import Foundation

// Use only Decodable protocol when need to decode JSON
// Use only Encodable protocol when need to encode JSON
// Use only Decodable & Encodable / Codable protocol when need to decode and encode
struct Person: Codable {
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

// Create an Person array for encoding
var people = [
    Person(name: "Robin", age: 30, gender: "Male", sign: "Sagittarius", partner: "Luna", isEmployed: false),
    Person(name: "Emily", age: 35, gender: "Female", sign: "Sagittarius", partner: "John", isEmployed: true)
]

extension Person {
    static func encodePersonObjToJSON() -> String {
        let encoder = JSONEncoder()
        let personJSONData = try! encoder.encode(people)
        let encodedString = String(data: personJSONData, encoding: .utf8)!
        return encodedString
    }
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
        
        // Custom date format
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd-MM-yyyy"
        //decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        // Swift date format type
        decoder.dateDecodingStrategy = .secondsSince1970
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file)'s data in the project!")
        }
        
        return loadedData
    }
}


