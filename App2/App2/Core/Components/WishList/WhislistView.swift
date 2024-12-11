//
//  WhislistView.swift
//  App2
//
//  Created by GOPAL BHUVA on 30/05/24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to your WishList")
                        .font(.largeTitle)
                    
                    Text("You can created or View it that wishlist oncwe you logged In")
                        .font(.title)
                }
                Button {
                    print("Log in")
                }label: {
                    Text("Log In")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                }
                Spacer()
            }.padding()
            .navigationTitle("WishList")
        }
    }
}

#Preview {
    WishlistView()
}

