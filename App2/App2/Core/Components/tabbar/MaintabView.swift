//
//  MaintabView.swift
//  App2
//
//  Created by GOPAL BHUVA on 30/05/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem{ Label("Explore", systemImage: "magnifyingglass" ) }
            
            WishlistView()
                .tabItem { Label("Wishlist", systemImage: "heart.fill") }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.fill") }
           
        }
        
        
    }
}

#Preview {
    MainTabView()
}

