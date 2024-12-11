//
//  ExploreViewModel.swift
//  App2
//
//  Created by GOPAL BHUVA on 31/05/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = " "
    private var service : ExploreService
    
    private var listingCopy = [Listing]()
    
    
    init(service: ExploreService) {
        self.service = service
        
        Task{  await fetchListing() }
    }
    
    func fetchListing() async {
        do {
            self.listings = try await service.fetchListing()
            
            self.listingCopy = listings
        } catch {
            print("DEBUG: failed to fetch listing witherror \(error.localizedDescription)")
        }
    }
    
    func updfateListingForLocation() {
        let filterListing = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.city.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filterListing.isEmpty ? listingCopy : filterListing
    }
}
