//
//  AYSearch.swift
//  SwiftUIP
//
//  Created by Xeven Dev on 29/07/2024.
//

import SwiftUI

public struct AYSearch<Item: Identifiable & Hashable, Content: View>: View {
    @Binding private var filteredItems: [Item]
    @Binding private var searchText: String
    private let content: (Item) -> Content
    
    public init(filteredItems: Binding<[Item]>, searchText: Binding<String>, @ViewBuilder content: @escaping (Item) -> Content) {
        self._filteredItems = filteredItems
        self._searchText = searchText
        self.content = content
    }
    
    public var body: some View {
        VStack {
            SearchBar(text: $searchText) // Custom SearchBar view
                .padding(.top)
            
            // Calculate the height of the list based on the number of filtered items
            let listHeight = CGFloat(filteredItems.count) * 44.0 // Assuming each row is 44 points high

            List(filteredItems) { item in
                content(item)
                    .onTapGesture {
                        // End user handles item selection
                    }
            }
            .listStyle(PlainListStyle())
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.teal, lineWidth: 0.5)
            )
            .frame(height: listHeight)
            .cornerRadius(5)
            .shadow(radius: 2)
            .padding()
        }
    }
}
