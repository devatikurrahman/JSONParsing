//
//  BookView.swift
//  JSONParsing
//
//  Created by Atikur Rahman on 10/19/23.
//

import SwiftUI

struct BookView: View {
    private let allBooks: [Book] = Book.allBooks
    var count = 0
    var body: some View {
        Text("All Books")
        List {
            ForEach(allBooks, id: \.id) { book in
                Text("\(book.feed.publisher)")
                Text("\(book.feed.country)")
                ForEach(book.entry, id: \.author) { entry in
                    Text("\(entry.author) - \(entry.nationality)")
                }
            }
        }
    }
}

#Preview {
    BookView()
}
