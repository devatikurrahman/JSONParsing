//
//  ContentView.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/16/23.
//

import SwiftUI


struct ContentView: View {
    private var persons: Person = Person.allPerson
    
    var body: some View {
        VStack {
            //ForEach(persons, id: \.name) { person in
                Text("\(persons.name)")
            //}
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
