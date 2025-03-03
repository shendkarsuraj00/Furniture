//
//  SearchView.swift
//  Furniture
//
//  Created by Macbook on 26/02/25.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Serach for Furniture", text: $searchText)
                    .padding()
            }
            .background(Color(.kSecondary))
            .clipShape(.rect(cornerRadius: 12))
            
            Image(systemName: "camera")
                .padding()
                .foregroundStyle(.white)
                .background(Color(.kPrimary))
                .clipShape(.rect(cornerRadius: 12))
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView()
}
