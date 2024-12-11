//
//  ExploreService.swift
//  App2
//
//  Created by GOPAL BHUVA on 31/05/24.
//

import Foundation


class ExploreService {
    func fetchListing() async throws -> [Listing] {
        return DeveplorePreview.shared.listing
    }
}
