//
//  ExploreView.swift
//  App2
//
//  Created by GOPAL BHUVA on 30/05/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @ObservedObject var ViewModel = ExploreViewModel(service: ExploreService())
    
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, ViewModel: ViewModel)
            }
            else {
                ScrollView {
                    SearchAndFilter(location: $ViewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                            
                        }
                    
                    LazyVStack(spacing: 32) {
                        ForEach(ViewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                    
                        .navigationBarBackButtonHidden()
                }
                
                        
                }
            }
        }
    }



#Preview {
    ExploreView()
}
