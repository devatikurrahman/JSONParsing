//
//  EncodingView.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/20/23.
//

import SwiftUI

struct EncodingView: View {
    let encodedString = Person.encodePersonObjToJSON()
    let familyEncodedString = Family.encodedFamilyObjToJSON()
    let eventEncodedString = Event.eventEncodingToJSON()
    
    var body: some View {
        Text("Person's encoded JSON string: \(encodedString)")
        Text("-----------------------------------------------")
        Text("Family's encoded JSON string: \(familyEncodedString)")
        Text("-----------------------------------------------")
        Text("Event's encoded JSON string: \(eventEncodedString)")
    }
}

#Preview {
    EncodingView()
}
