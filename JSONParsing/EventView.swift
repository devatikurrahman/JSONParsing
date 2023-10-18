//
//  EventView.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/18/23.
//

import SwiftUI

struct EventView: View {
    private let allEvents: [Event] = Event.allEvents
    
    var body: some View {
        List {
            ForEach(allEvents, id: \.name) { event in
                Text("\(event.name)")
                Text("\(event.date)")
                Text("\(event.website)")
            }
        }
    }
}

#Preview {
    EventView()
}
