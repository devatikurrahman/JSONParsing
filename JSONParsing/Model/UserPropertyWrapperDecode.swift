//
//  UserPropertyWrapperDecode.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/19/23.
//

import Foundation

// Adding decodable conformance for Property Wrappers
// Property wrappers such as @Published, do not conform to codable
/*class UserPropertyWrapperDecode: Decodable {
    var name = "John Richard"
    var age = 30
}*/

//
class UserPropertyWrapperDecode: ObservableObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case name, age
    }
    @Published var name = "John Richard"
    var age = 30
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
    }
}
