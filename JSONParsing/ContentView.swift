//
//  ContentView.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/16/23.
//

import SwiftUI


struct ContentView: View {
    private var singlePerson: Person = Person.singlePerson
    private var persons: [Person] = Person.allPerson
    
    var body: some View {
        VStack {
            // Single person info
            Text("\(singlePerson.name)")
            Text("-----------------------------------")
            
            // Get name from person array
            ForEach(persons, id: \.name) { person in
                Text("\(person.name) has partner \(person.partner ?? "none")")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
