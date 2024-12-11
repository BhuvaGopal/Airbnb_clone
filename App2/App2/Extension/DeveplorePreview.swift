//
//  DeveplorePreview.swift
//  App2
//
//  Created by GOPAL BHUVA on 31/05/24.
//

import Foundation

struct DeveplorePreview {
    static let shared = DeveplorePreview()
    
    
    var listing: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImaghgeUrl: "male-circle-photo",
            bedRooms: 4,
            numOfbathRoom: 3,
            numOfGuests: 4,
            numOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            ImageUrl: ["fp", "fphoto", "sPhoto", "tPhoto"],
            address: "124, main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.99,
            features: [.selfCheckIn, .superHost  ],
            amenties: [.wifi, .balcany, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Johnson Cook",
            ownerImaghgeUrl: "owner2",
            bedRooms: 4,
            numOfbathRoom: 3,
            numOfGuests: 4,
            numOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936, ImageUrl: ["fp", "fphoto", "sPhoto", "tPhoto"],
            address: "124, main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.99,
            features: [.selfCheckIn, .superHost  ],
            amenties: [.wifi,.balcany, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "David AB",
            ownerImaghgeUrl: "frame2",
            bedRooms: 4,
            numOfbathRoom: 3,
            numOfGuests: 4,
            numOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936, ImageUrl: ["fp", "fphoto", "sPhoto", "tPhoto"],
            address: "124, main St",
            city: "Los Angeles",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.99,
            features: [.selfCheckIn, .superHost  ],
            amenties: [.wifi, .balcany, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "David Cook",
            ownerImaghgeUrl: "Frame1",
            bedRooms: 4,
            numOfbathRoom: 3,
            numOfGuests: 4,
            numOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            ImageUrl: ["fp", "fphoto", "sPhoto", "tPhoto"],
            address: "124, main St",
            city: "Los Angeles",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.99,
            features: [.selfCheckIn, .superHost  ],
            amenties: [.wifi,  .balcany, .laundry, .tv],
            type: .villa
        ),
    ]
}
