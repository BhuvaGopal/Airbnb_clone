//
//  ListingImageCarouselView.swift
//  App2
//
//  Created by GOPAL BHUVA on 30/05/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.ImageUrl, id: \.self) { images in
                Image(images)
                    .resizable()
                    .scaledToFill()
            }
        }
       
        .tabViewStyle(.page)
        
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveplorePreview.shared.listing[0])
}

