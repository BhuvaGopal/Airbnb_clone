//
//  Lioting.swift
//  App2
//
//  Created by GOPAL BHUVA on 31/05/24.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImaghgeUrl: String
    let bedRooms: Int
    let numOfbathRoom: Int
    let numOfGuests: Int
    let numOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var ImageUrl: [String]
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var features: [Listingfeature]
    var amenties: [LiastingAmenties]
    let type: ListingType
}


enum Listingfeature: Int,Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    
    var ImageName: String {
        switch  self {
            
        case .selfCheckIn:
            return "door.left.hand.open"
        case .superHost:
            return "medal"
        }
    }
    
    var title: String {
        switch self {
            
        case .selfCheckIn:
            return "Self check-in"
        case .superHost:
            return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
            
        case .selfCheckIn:
            return "Check yourselfr in with keypad"
        case .superHost:
            return "DSuperhosts are experienced, highly rated who are commited to providing grearts starts for guests"
        }
    }
    
    var id: Int { return self.rawValue }
}


enum LiastingAmenties: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case office
    case balcany
    
    
    var title: String {
        switch self  {
        case .pool:
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "wifi"
        case .laundry:
            return "laundry"
        case .tv:
            return "tv"
        case .office:
            return "office"
        case .balcany:
            return "balcanys"
        }
    }
    
    var ImageName: String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .kitchen:
            return  "fork.knife"
        case .wifi:
            return  "wifi"
        case .laundry:
            return "washer"
        case .tv:
            return "tv"
        case .office:
            return "pencil.and.ruler.fill"
        case .balcany:
            return "building"
        }
    }
    
    
    
    var id: Int { return self.rawValue }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String {
        switch self {
            
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .townHouse:
            return "Town Home"
        case .villa:
            return "Villa"
        }
    }
    var id: Int { return  self.rawValue }
}
