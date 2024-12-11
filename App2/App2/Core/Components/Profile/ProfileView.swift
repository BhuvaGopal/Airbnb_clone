//
//  ProfileView.swift
//  App2
//
//  Created by GOPAL BHUVA on 30/05/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //Profile login View
            VStack(alignment: .leading,spacing: 32) {
                VStack(alignment: .leading,spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                    Text("Log in to start the journey")
                }
                

                Button {
                    print("Log in")
                }label: {
                    Text("Log In")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                }
                
                
                HStack {
                    Text("Dont have an Account")
                    
                    Text("Sign up")
                        .fontWeight(.black)
                        .underline()
                    
                }
                .font(.subheadline)
                    
            }
            
            
            // profile option
            VStack(spacing: 24) {
                ProfileoptionCView(ImageName: "gear", title: "Settings")
                ProfileoptionCView(ImageName: "gear", title: "Accesibility")
                ProfileoptionCView(ImageName: "gear", title: "visit the help center")


            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
