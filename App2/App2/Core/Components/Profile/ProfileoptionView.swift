//
//  ProfileoptionView.swift
//  App2
//
//  Created by GOPAL BHUVA on 30/05/24.
//
import SwiftUI

struct ProfileoptionCView: View {
    
    let ImageName: String
    let title: String
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: ImageName)
                
                Text(title)
                    .font(.title)
                
                Spacer()
            
                }
            }
            Divider()
        }
    }


#Preview {
    ProfileoptionCView(ImageName: "gear", title: "settings")
}

