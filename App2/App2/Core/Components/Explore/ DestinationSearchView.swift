//
//   DestinationSearchView.swift
//  App2
//
//  Created by GOPAL BHUVA on 30/05/24.
//

import SwiftUI


enum DestinationSearchOptions {
    case location
    case dates
    case Guests
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @ObservedObject var ViewModel: ExploreViewModel
    
   
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuest = 0
    
    
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.smooth) {
                        ViewModel.updfateListingForLocation()
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !ViewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        ViewModel.searchLocation = ""
                        ViewModel.updfateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    }
                }
                    .padding()
            
            
            
            
            VStack(alignment: .leading) {
                
                if selectedOption == .location {
                    Text("Where TO?")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        
                        TextField("search Destinatyion", text: $ViewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                ViewModel.updfateListingForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(Color(.systemGray))
                    }
                }
                
                else {
                    CollapsedPickerView(title: "When", description: "Add Destination")
                }
                
            }
            .modifier(CollapsibledestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180: 80)
            .onTapGesture {
                selectedOption = .location
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When is your Trip?")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("from", selection: $startDate, displayedComponents: .date)
                       
                        Divider()
                        DatePicker("To", selection: $startDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                }  else {
                    CollapsedPickerView(title: "When", description: "Add Details")
                }
                
            }
            .modifier(CollapsibledestinationViewModifier())
            .frame(height: selectedOption == .dates ? 200: 80)
            .onTapGesture {
                withAnimation(.smooth) { selectedOption = .dates }
            }
            
            
            VStack(alignment: .leading) {
                if selectedOption == .Guests {
                    Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuest) Adults")
                    } onIncrement: {
                        numGuest += 1
                    } onDecrement: {
                        guard numGuest >= 0 else { return }
                        numGuest -= 1
                    }
                        
                
                } else {
                    
                
                    CollapsedPickerView(title: "Who", description: "Add Guests")
                }
            }
            .modifier(CollapsibledestinationViewModifier())
            .frame(height: selectedOption == .dates ? 200: 80)
            
            .onTapGesture {
                withAnimation(.smooth) { selectedOption = .Guests }
            }
            Spacer()
        }
        
    }
}


#Preview {
    DestinationSearchView(show: .constant(false), ViewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibledestinationViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            
    }
}

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
        }
    }
}

