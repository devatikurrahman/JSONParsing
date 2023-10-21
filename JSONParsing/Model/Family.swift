//
//  Family.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/17/23.
//

import Foundation

struct Family: Codable {
    enum Gender: String, Codable {
        case Male, Female, Other
    }
    struct Person: Codable {
        let name: String
        let age: Int
        let gender: Gender
        let sign: String
        let partner: String?
        let isEmployed: Bool
    }
    let familyName: String
    let members: [Person]
}

extension Family {
    static let familyInfo: Family = Bundle.main.decodeJSON(file: "example3.json")
    //static let singleFamily: Family = allFamilies[0]
}

// Create an Family object for encoding
let myFamily = Family(familyName: "John Smith",
                      members: [
                        Family.Person(name: "Robin", age: 30, gender: .Male, sign: "Sagittarius", partner: "Luna", isEmployed: false),
                        Family.Person(name: "Emily", age: 35, gender: .Female, sign: "Sagittarius", partner: "John", isEmployed: true)
                      ])

extension Family {
    static func encodedFamilyObjToJSON() -> String {
        let encoder = JSONEncoder()
        let familyJSONData = try! encoder.encode(myFamily)
        let encodedString = String(data: familyJSONData, encoding: .utf8)!
        return encodedString
    }
}
