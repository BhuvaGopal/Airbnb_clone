//
//  ListinDetailView.swift
//  App2
//
//  Created by GOPAL BHUVA on 31/05/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    @State private var cameraaPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
let region = MKCoordinateRegion(center: listing.city == "Los Angeles" ?  .LosAngles  : .Miami,
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self._cameraaPosition = State(initialValue: .region(region))
    }
    
    
    @Environment(\.dismiss) var dismoss
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismoss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing:  8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                        
                        Text(" - ")
                        
                        
                        Text("28 Reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                  
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // host info View
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Entire \(listing.type.description) Villa hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 200, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("\(listing.numOfGuests) guests - ")
                        Text("\(listing.bedRooms) BedRoom - ")
                        Text("\(listing.numOfBeds) Beds - ")
                        Text("\(listing.numOfbathRoom) bathroom ")
                    }
                    .font(.caption)
                }
                .frame(width: 300)
                
                
                Spacer()
                
                Image(listing.ownerImaghgeUrl)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .scaledToFill()
                    .clipShape(Circle())
                
                
            }
            .padding()
            
            Divider()
            
            // listing featurtes
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features) { feature  in
                    HStack(spacing: 12) {
                        Image(systemName: feature.ImageName)
                        
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            
                            }
                        Spacer()
                        }
                    }
                }
            .padding()
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you want to sleep?")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach( 1 ... listing.bedRooms, id: \.self ) { BedRoom in
                            VStack {
                                Image(systemName: "bed.double")
                                
                                Text("BedsRooms  \(BedRoom)")
                                
                                }
                                .frame(width: 132, height: 100)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray)
                                }
                              
                            }
                        }
                    
                    }
                .scrollTargetBehavior(.paging)
                }
            .padding()
            
            Divider()
            
            //listing amenties
            VStack(spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach( listing.amenties) { amenity in
                    HStack {
                        Image(systemName:  amenity.ImageName )
                            .frame(width: 32)
                        
                        
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                        }
                    }
                
                }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you will be")
                    .font(.headline)
                
                
               Map(position: $cameraaPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
                }
            .padding()
            }
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                    Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before Taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 -20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                        
                        }
                    
                    Spacer()
                    
                    
                    Button {
                        
                    } label: {
                        Text("Reseve")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                        }
                    }
                .padding(.horizontal, 32)
                }
            .background(.white)
            }
        }
    }


#Preview {
    ListingDetailView(listing: DeveplorePreview.shared.listing[2])
}

