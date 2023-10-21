//
//  Event.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/18/23.
//

import Foundation

struct Event: Codable {
    let name: String
    let date: Date
    let website: URL
}

extension Event {
    static let allEvents: [Event] = Bundle.main.decodeJSON(file: "example4.json")
}


// Create an Family object for encoding
let myEvents = [
    Event(name: "Google Conference", date: Date(), website: URL(string: "https://www.google.com")!),
    Event(name: "Apple WWDC23 Conference", date: Date() + 30, website: URL(string: "https://www.apple.com")!)
]

extension Event {
    static func eventEncodingToJSON() -> String {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .millisecondsSince1970
        let eventJSONData = try! encoder.encode(myEvents)
        let encodedString = String(data: eventJSONData, encoding: .utf8)!
        return encodedString
    }
}
