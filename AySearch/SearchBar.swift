//
//  SearchBar.swift
//  SwiftUIP
//
//  Created by Xeven Dev on 29/07/2024.
//

import SwiftUI

public struct SearchBar: View {
    @Binding var text: String
    
    public init(text: Binding<String>) {
        self._text = text
    }
    
    public var body: some View {
        HStack {
         
                TextField("Search", text: $text)
                    .padding(10)
                    .foregroundColor(.black)
                    .background(Color(.white))
                    .cornerRadius(5)
                    .shadow(radius:2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.teal, lineWidth:0.5)
                    )
          
            
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(7)
                }
            }
        }
        .padding(.horizontal, 10)
    }
}

//
//#Preview {
//    SearchBar(text: .constant("Search"))
//}
