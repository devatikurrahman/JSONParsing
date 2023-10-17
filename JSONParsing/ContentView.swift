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
    private var family: Family = Family.familyInfo
    
    var body: some View {
        VStack {
            // Single person info
            Text("\(singlePerson.name)")
            Text("-----------------------------------")
            
            // Get name from person array
            ForEach(persons, id: \.name) { person in
                Text("\(person.name) has partner \(person.partner ?? "none")")
            }
            
            Text("-----------------------------------")
            // Get family info from families array
            Text("Family name: \(family.familyName)")
            Text("Family members are: ")
            ForEach(family.members, id: \.name) { member in
                Text("\(member.name)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
