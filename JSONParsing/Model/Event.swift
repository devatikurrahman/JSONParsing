//
//  Event.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/18/23.
//

import Foundation

struct Event: Decodable {
    let name: String
    let date: Date
    let website: URL
}

extension Event {
    static let allEvents: [Event] = Bundle.main.decodeJSON(file: "example4.json")
}

