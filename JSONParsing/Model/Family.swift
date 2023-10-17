//
//  Family.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/17/23.
//

import Foundation

struct Family: Decodable {
    enum Gender: String, Decodable {
        case Male, Female, Other
    }
    struct Person: Decodable {
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
