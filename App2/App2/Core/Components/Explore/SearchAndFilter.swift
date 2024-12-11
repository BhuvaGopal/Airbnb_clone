//
//  SearchAndFilter.swift
//  App2
//
//  Created by GOPAL BHUVA on 30/05/24.
//

import SwiftUI

struct SearchAndFilter: View {
    
    @Binding var location: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading,spacing: 2) {
                Text(location.isEmpty ? "Where To?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("\(location.isEmpty ? "Any Where - " : "" ) any week- add guest")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
            
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray3))
                .shadow(color: .black, radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilter(location: .constant("Los Angeles"))
}
